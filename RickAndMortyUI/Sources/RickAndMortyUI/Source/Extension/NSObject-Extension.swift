//
//  NSObject-Extension.swift
//  
//
//  Created by Cristian Peña Barrios on 23/04/24.
//

import Foundation

public extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var name: String {
        return String(describing: self)
    }
}
