//
//  Data+Ext.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 20/02/2025.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
