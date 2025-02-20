//
//  NetworkManager.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

class NetworkManager {
    let requestHandler: RequestHandler
    let responsehandler: ResponseHandler
    let multiPartRequestHandler: MultiPartRequestHandler
    
    init(
        requestHandler: RequestHandler = RequestHandler(),
        responsehandler: ResponseHandler = ResponseHandler(),
        multiPartRequestHandler: MultiPartRequestHandler = MultiPartRequestHandler()
    ) {
        self.requestHandler = requestHandler
        self.responsehandler = responsehandler
        self.multiPartRequestHandler = multiPartRequestHandler
    }
    
    func post<T: Codable, U: Codable>(urlString: String, body: U?) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw AppError(code: nil, status: "error", message: "invalid url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        if let body {
            let requestData = try encoder.encode(body)
            request.httpBody = requestData
        }
        
        let (code, data) = try await requestHandler.makeRequest(request: request)
        
        let returned: T = try responsehandler.decodeData(statusCode: code, data: data)
        return returned
    }
    
    func get<T: Codable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw AppError(code: nil, status: "error", message: "invalid url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (code, data) = try await requestHandler.makeRequest(request: request)
        
        let response: T = try responsehandler.decodeData(statusCode: code, data: data)
        return response
    }
    
    func upload<T: Codable>(urlString: String, parameters: [String: Any], images: [String : Data]) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw AppError(code: nil, status: "error", message: "invalid url")
        }
        
        let request = multiPartRequestHandler.generateRequest(to: url, parameters: parameters, images: images)
        
        let (code, data) = try await requestHandler.makeRequest(request: request)
        
        let returned: T = try responsehandler.decodeData(statusCode: code, data: data)
        return returned
    }
}

class RequestHandler {
    func makeRequest(request: URLRequest) async throws -> (Int, Data) {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        if let stringData = String(data: data, encoding: .utf8) {
            print("Raw Response Data with status code: \(response.statusCode)")
            print(stringData)
        }
        return (response.statusCode, data)
    }
}

class ResponseHandler {
    func decodeData<T: Codable>(statusCode: Int, data: Data) throws -> T {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        switch statusCode {
        case 200...299:
            do {
                let response = try? decoder.decode(T.self, from: data)
                if let response {
                    return response
                } else {
                    throw AppError(code: statusCode, status: "error", message: "Data could not be read")
                }
            }
        case 400...499:
            let returnedError = try? decoder.decode(AppError.self, from: data)
            if let returnedError {
                throw returnedError
            } else {
                throw AppError(code: statusCode, status: "error", message: "Data could not be read")
            }
        case 500...599:
            throw AppError(code: statusCode, status: "error", message: "Server Unavailable")
        default:
            print("Unhandled status code: \(statusCode)")
            throw AppError(code: statusCode, status: "error", message: "Something went wrong")
        }
    }
}

class MultiPartRequestHandler {
    
    func generateRequest(to url: URL, parameters: [String: Any], images: [String : Data]) -> URLRequest {
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        let mimeType = "image/jpeg"
        
        for (key, value) in parameters {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.append("\(value)\r\n")
        }
        
        for (key, img) in images {
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(key)\"\r\n")
            body.append("Content-Type: \(mimeType)\r\n\r\n")
            body.append(img)
            body.append("\r\n")
        }
        
            body.append("--\(boundary)--\r\n")
            request.httpBody = body
        
        return request
    }
}
