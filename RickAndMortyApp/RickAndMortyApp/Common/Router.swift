//
//  Router.swift
//
//
//  Created by Cristian Pena TWW on 19/04/24.
//

import UIKit
import RickAndMortyUI

protocol Routable {
    
    func pushViewController(withIdentifer identifier: String, in storyBoard: UIStoryboard.Storyboard, from viewController: UIViewController)
    
    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void)
    
    func pushAndReplaceViewController<T: UIViewController>(withIdentifer identifier: String,
                                                           type: T.Type,
                                                           in storyBoard: UIStoryboard.Storyboard,
                                                           from viewController: UIViewController,
                                                           moduleConfiguration: (T) -> Void)
    
    func present<T: UIViewController>(withIdentifier identifier: String,
                                      type: T.Type,
                                      in storyboard: UIStoryboard.Storyboard,
                                      from viewController: UIViewController,
                                      shouldBlockSwipeDown: Bool,
                                      shouldShowInFullScreen: Bool,
                                      shouldAnimate: Bool,
                                      presentationMode: UIModalPresentationStyle?,
                                      moduleConfiguration: (T) -> Void)
    
    func replaceRoot<T: UIViewController>(withIdentifier identifier: String,
                                          type: T.Type,
                                          in storyBoard: UIStoryboard.Storyboard,
                                          from viewController: UIViewController,
                                          previousViewControllers: [UIViewController],
                                          moduleConfiguration: (T) -> Void)
    
    func makeViewController<T: UIViewController>(identifier: String,
                                                 type: T.Type,
                                                 in storyboard: UIStoryboard.Storyboard) -> T
}

extension Routable {
    
    func pushViewController(withIdentifer identifier: String, in storyBoard: UIStoryboard.Storyboard, from viewController: UIViewController) {
        let storyBoard = UIStoryboard.storyboard(storyBoard)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void) {
        let bundle = Bundle(for: type)
        let storyBoard = UIStoryboard.storyboard(storyBoard, bundle: bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier) as! T
        
        moduleConfiguration(nextViewController)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func pushAndReplaceViewController<T: UIViewController>(withIdentifer identifier: String,
                                                           type: T.Type,
                                                           in storyBoard: UIStoryboard.Storyboard,
                                                           from viewController: UIViewController,
                                                           moduleConfiguration: (T) -> Void) {
        let bundle = Bundle(for: type)
        let storyBoard = UIStoryboard.storyboard(storyBoard, bundle: bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier) as! T
        
        moduleConfiguration(nextViewController)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
        
        guard let navigationController = viewController.navigationController,
              let coordinator = navigationController.transitionCoordinator else { return }
        
        coordinator.animate(alongsideTransition: nil) { _ in
            var navigationStack = navigationController.viewControllers
            navigationStack.removeAll(where: { $0 == viewController })
            
            navigationController.viewControllers = navigationStack
        }
    }
    
    func present<T: UIViewController>(withIdentifier identifier: String,
                                      type: T.Type,
                                      in storyboard: UIStoryboard.Storyboard,
                                      from viewController: UIViewController,
                                      shouldBlockSwipeDown: Bool = false,
                                      shouldShowInFullScreen: Bool = false,
                                      shouldAnimate: Bool = true,
                                      presentationMode: UIModalPresentationStyle? = nil,
                                      moduleConfiguration: (T) -> Void) {
        
        let bundle = Bundle(for: type)
        let storyboard = UIStoryboard.storyboard(storyboard, bundle: bundle)
        let nextViewController  = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        if #available(iOS 13.0, *) {
            navigationController.isModalInPresentation = shouldBlockSwipeDown
        }
        
        if shouldShowInFullScreen {
            navigationController.modalPresentationStyle = .fullScreen
        }
        
        if let presentationMode = presentationMode {
            navigationController.modalPresentationStyle = presentationMode
        }
        
        moduleConfiguration(nextViewController)
        viewController.present(navigationController, animated: shouldAnimate)
    }
    
    func replaceRoot<T: UIViewController>(withIdentifier identifier: String,
                                          type: T.Type,
                                          in storyBoard: UIStoryboard.Storyboard,
                                          from viewController: UIViewController,
                                          previousViewControllers: [UIViewController] = [],
                                          moduleConfiguration: (T) -> Void) {
        let bundle = Bundle(for: type)
        let storyBoard = UIStoryboard.storyboard(storyBoard, bundle: bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier) as! T
        let viewControllers = previousViewControllers + [nextViewController]
        
        moduleConfiguration(nextViewController)
        viewController.navigationController?.setViewControllers(viewControllers, animated: true)
    }
    
    func makeViewController<T: UIViewController>(identifier: String,
                                                 type: T.Type,
                                                 in storyboard: UIStoryboard.Storyboard) -> T {
        let storyboard = UIStoryboard.storyboard(storyboard)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        
        return viewController
    }
}
