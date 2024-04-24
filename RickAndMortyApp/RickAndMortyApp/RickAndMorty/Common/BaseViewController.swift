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
    
    
    // MARK: Properties
    
    
    // MARK: Views
    
    var viewBackground: UIView! {
        didSet {
            viewBackground.backgroundColor = Color.viewControllerBackground
            viewBackground.layer.cornerRadius = 48
        }
    }
    
    var loadingViewController: LoadingViewController!
    
    
    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.backgroundLine
        
        addViews()
    }
    
    
    // MARK: Private Methods
    
    private func addViews() {
        addViewCotrollerBackground()
    }
    
    private func addViewCotrollerBackground() {
        
        viewBackground = UIView()
        
        view.addSubview(viewBackground)
        view.sendSubviewToBack(viewBackground)
        
        viewBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
    }
    
    private func addLoading() {
        loadingViewController = LoadingViewController()
        
        viewBackground.addSubview(loadingViewController.view)
        viewBackground.bringSubviewToFront(loadingViewController.view)

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
