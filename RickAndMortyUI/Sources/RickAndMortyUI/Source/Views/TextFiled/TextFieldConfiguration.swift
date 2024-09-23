//
//  TextFieldConfiguration.swift
//
//
//  Created by Cristian Peña Barrios on 02/09/24.
//

import UIKit

public struct TextFieldConfiguration {
    
    public var placeholder: String?
    public var errorMessage: String?
    public var validationPattern: String?
    public var keyboardType: UIKeyboardType
    public var autocapitalizationType: UITextAutocapitalizationType
    
    public init(placeholder: String? = .none,
                errorMessage: String? = .none,
                validationPattern: String? = .none,
                keyboardType: UIKeyboardType = .default,
                autocapitalizationType: UITextAutocapitalizationType = .none) {
        
        self.placeholder = placeholder
        self.validationPattern = validationPattern
        self.errorMessage = errorMessage
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
    }
}
