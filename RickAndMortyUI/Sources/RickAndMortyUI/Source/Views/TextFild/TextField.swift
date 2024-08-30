//
//  TextField.swift
//
//
//  Created by Cristian Peña Barrios on 29/08/24.
//

import UIKit
import SnapKit

public class TextField: UIView {
    
    
    // MARK: Views
    
    private var titleLabel: UILabel! {
        didSet {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.font = UIFont.systemFont(ofSize: 12)
            titleLabel.alpha = 0
        }
    }
    
    internal var textField: PaddedTextField! {
        didSet {
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.backgroundColor = Color.gray
            textField.layer.cornerRadius = 6
            textField.delegate = self
        }
    }
    
    private var messageLabel: UILabel! {
        didSet {
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.font = UIFont.systemFont(ofSize: 12)
            messageLabel.textColor = .red
            messageLabel.isHidden = true
        }
    }
    
    
    // MARK: Properties
    
    public var placeholder = "" {
        didSet {
            textField.placeholder = placeholder
            titleLabel.text = placeholder
        }
    }
    
    public var validationPattern: String?
    public var errorMessage: String?
    
    /// Description
    /// Tipos de teclado disponibles:
    /// - default: El teclado estándar del sistema.
    /// - asciiCapable: Un teclado con caracteres ASCII.
    /// - numbersAndPunctuation: Teclado para números y puntuación.
    /// - URL: Teclado optimizado para la entrada de URLs.
    /// - numberPad: Teclado numérico simple.
    /// - phonePad: Teclado para entrada de números de teléfono.
    /// - emailAddress: Teclado optimizado para la entrada de correos electrónicos.
    /// - decimalPad: Teclado numérico con soporte para punto decimal.
    /// - twitter: Teclado optimizado para la entrada de Twitter (con símbolos comunes como “@” y “#”).
    /// - webSearch: Teclado optimizado para la búsqueda web.
    public var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    
    public var autocapitalizationType: UITextAutocapitalizationType = .none {
        didSet {
            textField.autocapitalizationType = autocapitalizationType
        }
    }
    
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Functionalities
    
    internal func setup() {
        self.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        titleLabel = UILabel()
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        let padding: UIEdgeInsets = UIEdgeInsets(top: 0, 
                                                 left: 8,
                                                 bottom: 0,
                                                 right: 8)
        
        textField = PaddedTextField(padding: padding)
        addSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
        }
        
        messageLabel = UILabel()
        addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.top.equalTo(textField.snp.bottom)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview()
        }
    }
    
    internal func animateTitleLabel(visible: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.titleLabel.alpha = visible ? 1.0 : 0.0
        }
    }
    
    
    // MARK: Validation
    
    public func validate() -> Bool {
        guard let pattern = validationPattern, let text = textField.text else {
            return true
        }
        
        let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
        let range = NSRange(location: 0, length: text.utf16.count)
        
        if let _ = regex?.firstMatch(in: text, options: [], range: range) {
            hideError()
            return true
        } else {
            showError(message: errorMessage ?? "Error de validación")
            return false
        }
    }
    
    private func showError(message: String) {
        messageLabel.text = message
        messageLabel.isHidden = false
    }
    
    private func hideError() {
        messageLabel.isHidden = true
        messageLabel.text = nil
    }
}

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
            animateTitleLabel(visible: true)
        } else {
            animateTitleLabel(visible: false)
        }
    }
}
