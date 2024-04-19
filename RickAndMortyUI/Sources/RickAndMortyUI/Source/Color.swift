//
//  File.swift
//  
//
//  Created by Cristian Peña Barrios on 19/04/24.
//

import UIKit


public struct Color {
    
    static let background: UIColor = newColor(with: "RMBackground")
    
    static func newColor(with name: String) -> UIColor {
        return UIColor(named: name) ?? UIColor.orange
    }
}
