//
//  PaddedTextField.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import Foundation
import UIKit

class PaddedTextField: UITextField {
    var padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
