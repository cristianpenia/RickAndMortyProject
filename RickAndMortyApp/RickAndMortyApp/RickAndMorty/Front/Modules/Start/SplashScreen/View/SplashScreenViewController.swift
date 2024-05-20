//
//  SplashScreenSplashScreenViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 20/05/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit
import RickAndMortyUI

class SplashScreenViewController: UIViewController {

    
    // MARK: Views
    
    @IBOutlet weak var rickAndMortyImage: UIImageView! {
        didSet {
            rickAndMortyImage.image = Media.Image.rickAndMorty
        }
    }
    
    // MARK: Properties
    
    var output: SplashScreenViewOutput!

    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}


// MARK: SplashScreenViewInput

extension SplashScreenViewController: SplashScreenViewInput {
    
    func setupInitialState() {
    }
}
