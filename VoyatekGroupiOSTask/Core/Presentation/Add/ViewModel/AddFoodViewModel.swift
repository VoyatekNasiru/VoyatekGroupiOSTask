//
//  AddFoodViewModel.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation
import UIKit

@MainActor
class AddFoodViewModel {
    let service: FoodService
    var onSuccess: (() -> ())?
    var onError: ((String) -> ())?
    var name: String = ""
    var description: String = ""
    var calories: Int = 0
    var category: Int = 0
    var tags: [String] = []
    var images: [UIImage] = []
    
    init(service: FoodService = FoodServiceImpl()) {
        self.service = service
    }
    
    func createFood() {
        Task {
            do {
                var params: [String : Any] = [:]
                params["name"] = name
                params["description"] = description
                params["category_id"] = category
                params["calories"] = calories
                
                for (index, tag) in tags.enumerated() {
                    params["tags[\(index)]"] = index + 1
                }
                
                var imagesToUpload: [String : Data] = [:]
                for (index, image) in images.enumerated() {
                    if let imagedata = image.jpegData(compressionQuality: 0.4) {
                        imagesToUpload["images[\(index)]"] = imagedata
                    }
                }
                
                let response = try await service.createFood(params: params, images: imagesToUpload)
                onSuccess?()
                print("success: \(response)")
            } catch let error as AppError {
                print("error \(error)")
                onError?(error.message ?? "Something went wrong")
            } catch {
                onError?(error.localizedDescription)
            }
        }
    }
}
