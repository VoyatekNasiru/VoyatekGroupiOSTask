//
//  HomeViewModel.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    var service: FoodService
    
    init(service: FoodService = FoodServiceImpl()) {
        self.service = service
    }
    @Published var showLoader: Bool = false
    @Published var foods: [Food] = []
    @Published var categories: [Category] = []
    @Published var searchText: String = ""
    @Published var selectedCategoryIndex: Int = 0
    var onFetchComplete: (() -> ())?
    
    var filteredFoods: [Food] {
        if selectedCategoryIndex == 0 && !searchText.isEmpty {
            return foods.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
        } else if selectedCategoryIndex != 0 && searchText.isEmpty {
            return foods.filter { $0.category?.id == selectedCategoryIndex}
        } else if selectedCategoryIndex != 0 && !searchText.isEmpty {
            let foodsInCategory = foods.filter { $0.category?.id == selectedCategoryIndex}
            return foodsInCategory.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false}
            
        } else {
            return foods
        }
    }
    var foodMenuTitle: String {
        if selectedCategoryIndex == 0 {
            return "All Foods"
        } else {
            return categories.first { $0.id == selectedCategoryIndex}?.name ?? ""
        }
    }
    
    func fetchFoodsAndCategories() {
        Task {
            showLoader = true
            defer {
                showLoader = false
            }
            do {
                let categoriesResponse = try await service.fetchCategories()
                let foodsResponse = try await service.fetchFoods()
                categories = categoriesResponse.data ?? []
                foods = foodsResponse.data ?? []
            } catch let error as AppError {
                print(error)
            }
        }
    }
}
