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
        
    }
    
    public struct Image {
        
        public static let rickAndMorty = UIImage(named: Name.rickAndMorty, in: .module, with: nil)
    }
    
    public struct Lottie {
        
        public static let loading = "loading"
    }
}
