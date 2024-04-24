//
//  File.swift
//  
//
//  Created by Cristian Peña Barrios on 23/04/24.
//

import UIKit
import Combine

public class CharacterViewModel {
    
    @Published var character: Character
    
    var cancellables: Set<AnyCancellable> = []
    
    public init(character: Character) {
        self.character = character
    }
    
    func updateProfile() {
        // Simula una actualización
        character.username = "NewUsername"
    }
}
