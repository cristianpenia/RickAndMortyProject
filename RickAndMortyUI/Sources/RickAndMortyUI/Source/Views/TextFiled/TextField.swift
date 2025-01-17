//
//  TextField.swift
//
//
//  Created by Cristian Peña Barrios on 29/08/24.
//

import UIKit
import SnapKit


// TODO: reactividad
// TODO: validacion default

public class TextField: UIView {
    
    
    // MARK: Views
    
    private var titleLabel: UILabel! {
        didSet {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.font = UIFont.systemFont(ofSize: 12)
            titleLabel.textColor = .darkGray
            titleLabel.alpha = 0
//            titleLabel.backgroundColor = .red
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
//            messageLabel.backgroundColor = .orange
        }
    }
    
    
    // MARK: Properties
    
    // TODO: generar documentacion documentacion
    private var configuration: TextFieldConfiguration {
        didSet {
            placeholder = configuration.placeholder ?? ""
            validationPattern = configuration.validationPattern
            errorMessage = configuration.errorMessage
            keyboardType = configuration.keyboardType
            autocapitalizationType = configuration.autocapitalizationType
        }
    }
    
    private var placeholder = "" {
        didSet {
            textField.placeholder = placeholder
            titleLabel.text = placeholder
        }
    }
    
    private var validationPattern: String?
    private var errorMessage: String?
    public  var text: String?
    
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
    private var keyboardType: UIKeyboardType = .default {
        didSet {
            textField.keyboardType = keyboardType
        }
    }
    
    private var autocapitalizationType: UITextAutocapitalizationType = .none {
        didSet {
            textField.autocapitalizationType = autocapitalizationType
        }
    }
    
    
    // MARK: Lifecycle
    
    override init(frame: CGRect) {
        configuration = TextFieldConfiguration()
        
        super.init(frame: frame)
        
        setup()
        setupTextField()
    }
    
    public init(frame: CGRect = CGRect(), configuration: TextFieldConfiguration) {
        
        self.configuration = configuration
        
        super.init(frame: frame)
        
        placeholder = self.configuration.placeholder ?? ""
        validationPattern = self.configuration.validationPattern
        errorMessage = self.configuration.errorMessage
        keyboardType = self.configuration.keyboardType
        autocapitalizationType = self.configuration.autocapitalizationType
        
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
        titleLabel.text = configuration.placeholder
        
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
        textField.placeholder = configuration.placeholder
        
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
        if let pattern = validationPattern, let text = textField.text  {
            
            let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
            let range = NSRange(location: 0, length: text.utf16.count)
            
            if let _ = regex?.firstMatch(in: text, options: [], range: range) {
                hideError()
                self.text = text
                return true
            } else {
                showError(message: errorMessage ?? "Error de validación")
                return false
            }
        } else {
            return true
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
