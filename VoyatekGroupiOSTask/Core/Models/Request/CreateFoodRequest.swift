//
//  CreateFoodRequest.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 20/02/2025.
//

import Foundation

struct CreateFoodRequest: Codable {
    let name: String
    let description: String
    let categoryId: Int
    let calories: Int
    let tags: [String]
    let images: [Data]
}
