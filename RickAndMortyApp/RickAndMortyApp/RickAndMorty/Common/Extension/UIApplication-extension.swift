//
//  UIApplication-extension.swift
//
//
//  Created by Cristian Peña Barrios on 23/04/24.
//

import UIKit

extension UIApplication {
    
    var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
}
