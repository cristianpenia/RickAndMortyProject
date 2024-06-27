//
//  UIStoryboard-extension.swift
//
//
//  Created by Cristian Peña Barrios on 23/04/24.
//

import UIKit

public extension UIStoryboard {
    
    enum Storyboard: String {
        
        case start
        case home
        
        var filename: String {
            let firstLetter = rawValue.prefix(1)
            let camelCaseStoryboardName = firstLetter.uppercased() + rawValue.suffix(rawValue.count - 1)
            return camelCaseStoryboardName
        }
    }
    
    static func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    static func instantiateInitialViewController(of storyboard: Storyboard, bundle: Bundle? = nil) -> UIViewController {
        let storyBoard = UIStoryboard.storyboard(storyboard)
        let viewController = storyBoard.instantiateInitialViewController()
        
        return viewController!
    }
    
}

public protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

public extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
}
