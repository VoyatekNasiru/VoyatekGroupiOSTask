//
//  FoodServiceImpl.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

struct FoodServiceImpl: FoodService {
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchFoods() async throws -> FetchFoodResponse {
        let response: FetchFoodResponse = try await networkManager.get(urlString: URLs.fetchFoods.value)
        return response
    }
    
    func fetchCategories() async throws -> FetchCategoriesResponse {
        let response: FetchCategoriesResponse = try await networkManager.get(urlString: URLs.fetchCategories.value)
        return response
    }
    
    func createFood(params: [String : Any], images: [String : Data]) async throws -> CreateFoodResponse {
        let response: CreateFoodResponse = try await networkManager.upload(urlString: URLs.fetchFoods.value, parameters: params, images: images)
        return response
    }
}
