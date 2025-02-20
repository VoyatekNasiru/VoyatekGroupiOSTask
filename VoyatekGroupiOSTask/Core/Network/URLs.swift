//
//  URLs.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

enum URLs {
    case fetchFoods
    case fetchCategories
    
    var value: String {
        switch self {
        case .fetchFoods:
            URLs.baseUrl + "/api/foods"
        case .fetchCategories:
            URLs.baseUrl + "/api/categories"
        }
    }
    static let baseUrl: String = "https://assessment.vgtechdemo.com"
}
