//
//  CreateFoodResponse.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 20/02/2025.
//

import Foundation

struct CreateFoodResponse: Codable {
    let status: String?
    let message: String?
    let data: Food?
}
