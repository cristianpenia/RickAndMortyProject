//
//  TextFieldv2ViewModel.swift
//
//
//  Created by Cristian Peña Barrios on 30/08/24.
//

import Combine
import Foundation

class TextFieldv2ViewModel {
    
    // Input
    @Published var text: String = ""
    
    // Output
    @Published var isValid: Bool = true
    @Published var errorMessage: String? = nil
    @Published var shouldShowTitle: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    private var validationPattern: String?
    private var customErrorMessage: String?
    
    init(validationPattern: String?, errorMessage: String?) {
        self.validationPattern = validationPattern
        self.customErrorMessage = errorMessage
        
        setupBindings()
    }
    
    private func setupBindings() {
        // Validar el texto en base a la expresión regular
        $text
            .map { [weak self] text in
                guard let pattern = self?.validationPattern else { return true }
                let regex = try? NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
                let range = NSRange(location: 0, length: text.utf16.count)
                return regex?.firstMatch(in: text, options: [], range: range) != nil
            }
            .assign(to: \.isValid, on: self)
            .store(in: &cancellables)
        
        // Mostrar u ocultar el mensaje de error
        $isValid
            .map { [weak self] isValid in
                isValid ? nil : self?.customErrorMessage
            }
            .assign(to: \.errorMessage, on: self)
            .store(in: &cancellables)
        
        // Mostrar u ocultar el título en base al texto
        $text
            .map { !$0.isEmpty }
            .assign(to: \.shouldShowTitle, on: self)
            .store(in: &cancellables)
    }
}
