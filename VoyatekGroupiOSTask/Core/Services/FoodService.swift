//
//  FoodService.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

protocol FoodService {
    func fetchFoods() async throws -> FetchFoodResponse
    func fetchCategories() async throws -> FetchCategoriesResponse
    func createFood(params: [String : Any], images: [String : Data]) async throws -> CreateFoodResponse
}
