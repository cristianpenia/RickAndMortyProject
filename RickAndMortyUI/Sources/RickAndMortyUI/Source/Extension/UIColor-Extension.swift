//
//  UIColor-Extension.swift
//  
//
//  Created by Cristian Pena TWW on 19/04/24.
//

import UIKit

extension UIColor {
    
    static func newColor(with name: String) -> UIColor {
        return UIColor(named: name, in: Bundle.module, compatibleWith: nil) ?? UIColor.orange
    }
}
