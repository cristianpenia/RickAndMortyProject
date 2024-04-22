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
    
    var viewBackground: UIView! {
        didSet {
            viewBackground.backgroundColor = Color.viewControllerBackground
            viewBackground.layer.cornerRadius = 48
        }
    }
    
    
    // Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.background
        
        addViews()
    }
    
    
    // MARK: Private Methods
    
    private func addViews() {
        addViewCotrollerBackground()
    }
    
    private func addViewCotrollerBackground() {
        viewBackground = UIView()
        
        view.addSubview(viewBackground)
        
        viewBackground.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
}
