//
//  FetchFoodResponse.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

struct FetchFoodResponse: Codable {
    let status: String?
    let message: String?
    let data: [Food]?
}

struct Food: Codable, Hashable {
    let id: Int?
    let name: String?
    let description: String?
    let categoryId: Int?
    let calories: Int?
    let foodTags: [String]?
    let foodImages: [FoodImage]?
    let category: Category?
    let createdAt: String?
    let updatedAt: String?
    
    static let mockFoodList: [Food] = [
        Food(
            id: 1,
            name: "NEW RESTURANT TEST",
            description: "Creamy hummus spread on whole grain toast topped with sliced cucumbers and radishes...",
            categoryId: 8,
            calories: 20,
            foodTags: ["Keto", "Paleo"],
            foodImages: [
                FoodImage(id: 1, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739607977_WhatsApp_Image_2025-01-19_at_14.17.36-removebg-preview.png"),
                FoodImage(id: 2, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739607977_WhatsApp Image 2025-01-19 at 14.12.54.jpeg")
            ],
            category: Category(id: 8, name: "Meat", description: "Beef, pork, and other meats", 
                               createdAt: "2025-02-15T08:15:56.000000Z", updatedAt: "2025-02-15T08:15:56.000000Z"),
            createdAt: "2025-02-15T08:26:17.000000Z",
            updatedAt: "2025-02-15T08:26:17.000000Z"
        ),
        Food(
            id: 2,
            name: "Spicy Beef Suya",
            description: "A popular West African street food consisting of thinly sliced beef skewers...",
            categoryId: 8,
            calories: 213,
            foodTags: ["Sweet", "Paleo"],
            foodImages: [
                FoodImage(id: 3, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739647308_suya.jpeg"),
                FoodImage(id: 4, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739647308_suyaa.jpeg")
            ],
            category: Category(id: 8, name: "Meat", description: "Beef, pork, and other meats", createdAt: "2025-02-15T08:15:56.000000Z", updatedAt: "2025-02-15T08:15:56.000000Z"),
            createdAt: "2025-02-15T19:21:48.000000Z",
            updatedAt: "2025-02-15T19:21:48.000000Z"
        ),
        Food(
            id: 3,
            name: "Test",
            description: "Test",
            categoryId: 1,
            calories: 100,
            foodTags: ["Spicy", "Sweet"],
            foodImages: [
                FoodImage(id: 5, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739659041_image_1739658996238.jpg")
            ],
            category: Category(id: 1, name: "Healthy", description: "Nutritious and beneficial for health", createdAt: "2025-02-15T08:15:56.000000Z", updatedAt: "2025-02-15T08:15:56.000000Z"),
            createdAt: "2025-02-15T22:37:21.000000Z",
            updatedAt: "2025-02-15T22:37:21.000000Z"
        ),
        Food(
            id: 4,
            name: "Testw",
            description: "Testw",
            categoryId: 3,
            calories: 100,
            foodTags: ["Spicy", "Sweet"],
            foodImages: [
                FoodImage(id: 6, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739659547_image_1739659420572.jpg"),
                FoodImage(id: 7, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739659547_image_1739659425652.jpg")
            ],
            category: Category(id: 3, name: "Desserts", description: "Sweet treats and confections", createdAt: "2025-02-15T08:15:56.000000Z", updatedAt: "2025-02-15T08:15:56.000000Z"),
            createdAt: "2025-02-15T22:45:47.000000Z",
            updatedAt: "2025-02-15T22:45:47.000000Z"
        ),
        Food(
            id: 5,
            name: "DEvafo Resturtant",
            description: "Creamy hummus spread on whole grain toast topped with sliced cucumbers and radishes...",
            categoryId: 5,
            calories: 50,
            foodTags: ["Keto", "Paleo", "Comfort Food"],
            foodImages: [
                FoodImage(id: 8, imageUrl: "https://assessment.vgtechdemo.com//food_images/1739659881_image_1739659853179.jpg")
            ],
            category: Category(id: 5, name: "Vegetarian", description: "Plant-based meals", createdAt: "2025-02-15T08:15:56.000000Z", updatedAt: "2025-02-15T08:15:56.000000Z"),
            createdAt: "2025-02-15T22:51:21.000000Z",
            updatedAt: "2025-02-17T07:05:38.000000Z"
        )
    ]
}

struct FoodImage: Codable, Hashable {
    let id: Int?
    let imageUrl: String?
}
