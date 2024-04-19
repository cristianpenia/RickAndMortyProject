//
//  File.swift
//  
//
//  Created by Cristian Peña Barrios on 19/04/24.
//

import UIKit


public struct Color {
    
    struct Name {
        
        static let background = "RMBackground"
    }
    
    public static let background: UIColor = UIColor.white
    public static let viewControllerBackground: UIColor = UIColor.newColor(with: Name.background)
    
}


