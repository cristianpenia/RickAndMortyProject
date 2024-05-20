//
//  File.swift
//  
//
//  Created by Cristian Pena TWW on 19/04/24.
//

import UIKit

public struct Media {
    
    struct Name {
        
        // Image
        static let rickAndMorty = "RickAndMorty"
        static let rickAndMortyName = "RickAndMortyName"
        
    }
    
    public struct Image {
        
        public static let rickAndMorty = UIImage(named: Name.rickAndMorty, in: .module, with: nil)
        public static let rickAndMortyName = UIImage(named: Name.rickAndMortyName, in: .module, with: nil)
    }
    
    public struct Lottie {
        
        public static let loading = "loading"
    }
}
