//
//  FetchCategoriesResponse.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

struct FetchCategoriesResponse: Codable {
    let status: String?
    let message: String?
    let data: [Category]?
}

struct Category: Codable, Hashable {
    let id: Int?
    let name: String?
    let description: String?
    let createdAt: String?
    let updatedAt: String?
}

extension Category {
    static let mockData: [Category] = [
        Category(id: 1, name: "Healthy", description: "Nutritious and beneficial for health", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 2, name: "Fast Food", description: "Quick and convenient meals", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 3, name: "Desserts", description: "Sweet treats and confections", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 4, name: "Beverages", description: "Drinks and refreshments", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 5, name: "Vegetarian", description: "Plant-based meals", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 6, name: "Vegan", description: "Meals without animal products", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 7, name: "Seafood", description: "Fish and other sea creatures", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 8, name: "Meat", description: "Beef, pork, and other meats", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 9, name: "Poultry", description: "Chicken, turkey, and other birds", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 10, name: "Snacks", description: "Light bites and nibbles", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 11, name: "Bakery", description: "Bread, cakes, and pastries", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 12, name: "Dairy", description: "Milk, cheese, and other dairy products", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 13, name: "Frozen Food", description: "Frozen meals and ingredients", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 14, name: "Organic", description: "Naturally grown and processed foods", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z"),
        Category(id: 15, name: "Gluten-Free", description: "Foods without gluten", createdAt: "2024-12-20T21:07:09.000000Z", updatedAt: "2024-12-20T21:07:09.000000Z")
    ]
}
