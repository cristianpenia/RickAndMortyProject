//
//  File.swift
//  
//
//  Created by Cristian Pena TWW on 19/04/24.
//

import UIKit

public struct Device {
    
    public static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
    public static let screenHeight = UIScreen.main.bounds.height
}
