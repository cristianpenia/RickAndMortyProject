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

/// StoryboardIdentifiable es un protocolo usado para obtener el identificador de cada View
protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

/// Se implemente una implementación por defecto en el protocolo para obtener el identificador
extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
}

/// Al extender `StoryboardIdentifiable` a todos los `UIViewController` facilitamos el acceso a este
extension UIViewController: StoryboardIdentifiable { }
