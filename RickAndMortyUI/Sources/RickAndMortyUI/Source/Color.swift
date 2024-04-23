//
//  File.swift
//  
//
//  Created by Cristian Peña Barrios on 19/04/24.
//

import UIKit


public struct Color {
    
    struct Name {
        
        static let backgroundLine = "RMBackgroundLine"
        static let viewControllerBackground = "RMBackground"
    }
    
    public static let backgroundLine: UIColor = UIColor.newColor(with: Name.backgroundLine)
    public static let viewControllerBackground: UIColor = UIColor.newColor(with: Name.viewControllerBackground)
    
}


