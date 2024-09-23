//
//  TextField+UITextFieldDelegate.swift
//
//
//  Created by Cristian Peña Barrios on 30/08/24.
//

import UIKit

extension TextField: UITextFieldDelegate {
    
    internal func setupTextField() {
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc private func textFieldEditingDidBegin() {
        if let text = textField.text, !text.isEmpty {
            animateTitleLabel(visible: true)
        }
    }
    
    @objc private func textFieldEditingDidEnd() {
        if let text = textField.text, text.isEmpty {
            animateTitleLabel(visible: false)
        } else {
            _ = validate()
        }
    }
    
    @objc private func textFieldDidChange() {
        if let text = textField.text, !text.isEmpty {
            self.text = text
            animateTitleLabel(visible: true)
        } else {
            animateTitleLabel(visible: false)
        }
    }
}
