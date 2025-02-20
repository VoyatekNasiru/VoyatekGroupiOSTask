//
//  AppError.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation

struct AppError: Codable, Error {
    let code: Int?
    let status: String?
    let message: String?
}
