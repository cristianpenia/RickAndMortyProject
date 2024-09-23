//
//  File.swift
//  
//
//  Created by Cristian Peña Barrios on 30/08/24.
//

import UIKit
import Combine

public class TextFieldv2: UIView {
    
    // MARK: - Views
    
    private var titleLabel: UILabel!
    private var textField: PaddedTextField!
    private var messageLabel: UILabel!
    
    // MARK: - Properties
    
    private var viewModel: TextFieldv2ViewModel!
    private var cancellables = Set<AnyCancellable>()
    
    public var placeholder: String = "" {
        didSet {
            textField.placeholder = placeholder
            titleLabel.text = placeholder
        }
    }
    
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
    
    // MARK: - Initializer
    
    public init(frame: CGRect, validationPattern: String?, errorMessage: String?) {
        super.init(frame: frame)
        viewModel = TextFieldv2ViewModel(validationPattern: validationPattern, errorMessage: errorMessage)
        setup()
        setupBindings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        // Configurar las vistas (igual que antes)
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.alpha = 0
        
        textField = PaddedTextField(padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        textField.backgroundColor = .gray
        textField.layer.cornerRadius = 6
        textField.autocapitalizationType = .none
        textField.delegate = self
        
        messageLabel = UILabel()
        messageLabel.font = UIFont.systemFont(ofSize: 12)
        messageLabel.textColor = .red
        messageLabel.isHidden = true  // Asegúrate de que el mensaje esté oculto inicialmente
        
        // Agregar subviews en el orden correcto
        addSubview(titleLabel)
        addSubview(textField)
        addSubview(messageLabel)
        
        // Layout con SnapKit (o manualmente)
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
        }
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview()
        }
        
        messageLabel.snp.makeConstraints { make in
            make.height.equalTo(18)
            make.top.equalTo(textField.snp.bottom)
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview()
        }
    }
    
    private func setupBindings() {
        viewModel.$shouldShowTitle
            .sink { [weak self] shouldShow in
                UIView.animate(withDuration: 0.3) {
                    self?.titleLabel.alpha = shouldShow ? 1.0 : 0.0
                }
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .sink { [weak self] errorMessage in
                self?.messageLabel.text = errorMessage
                self?.messageLabel.isHidden = errorMessage == nil
            }
            .store(in: &cancellables)
    }
    
    @objc private func textFieldDidChange() {
        viewModel.text = textField.text ?? ""
    }
}

extension TextFieldv2: UITextFieldDelegate {
    func textFieldEditingDidEnd(_ textField: UITextField) {
        viewModel.text = textField.text ?? ""
    }
}
