//
//  BaseViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Pena Barrios on 19/04/24.
//

import UIKit
import RickAndMortyUI
import SnapKit

class BaseViewController: UIViewController {
    
    
    // MARK: Views
    
    
    // MARK: Properties
    
    var loadingViewController: LoadingViewController!
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.viewControllerBackground
        
        addViews()
    }
    
    
    // MARK: Private Methods
    
    private func addViews() {
//        addLoading()
    }
    
    private func addLoading() {
        loadingViewController = LoadingViewController()
        
        view.addSubview(loadingViewController.view)
        view.bringSubviewToFront(loadingViewController.view)

        loadingViewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
    // MARK: Public Methods
    
    public func showViewLoading() {
        addLoading()
    }
    
    public func hideViewLoading() {
        if let loadingView = self.loadingViewController.view.viewWithTag(100) {
            UIView.animate(withDuration: 0.3, animations: {
                loadingView.alpha = 0
            }) { completed in
                if completed {
                    loadingView.removeFromSuperview()
                }
            }
        }
    }
}
