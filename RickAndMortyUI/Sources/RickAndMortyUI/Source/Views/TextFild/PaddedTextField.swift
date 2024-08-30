//
//  PaddedTextField.swift
//
//
//  Created by Cristian Peña Barrios on 30/08/24.
//

import UIKit

class PaddedTextField: UITextField {
    
    
    // MARK: Properties
    
    var padding: UIEdgeInsets
    
    
    // MARK: Lifecycle
    
    init(padding: UIEdgeInsets) {
        self.padding = padding
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        self.padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        super.init(coder: coder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
