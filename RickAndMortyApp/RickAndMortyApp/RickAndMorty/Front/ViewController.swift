//
//  ViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 19/04/24.
//

import UIKit
import RickAndMortyUI
import Lottie

class ViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addViews()
    }

    private func addViews() {

        addLoading()
    }

    private func addLoading() {
        
        let v = LoadingViewController()
        viewBackground.addSubview(v.view)
        
        v.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

