//
//  HomeHomeViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 23/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit
import RickAndMortyUI

class HomeViewController: UIViewController, HomeViewInput {

    private var characterView = CharacterView()
    private var viewModel: CharacterViewModel?
    
    var output: HomeViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
        
        test()
    }
            
    private func test() {
        
        view.addSubview(characterView)
        
        characterView.frame = view.bounds
        
        let url = URL(string: "https://static.wikia.nocookie.net/rick-y-morty-espanol/images/4/4f/Rick_Sánchez_Joven.jpg/revision/latest/scale-to-width/360?cb=20231130231801&path-prefix=es")
        
        let characterModel = Character(profilePictureURL: url!, username: "Rick Sanchez", description: "Viejo loco")
        
        viewModel = CharacterViewModel(character: characterModel)
        
        characterView.viewModel = viewModel
    }

    // MARK: HomeViewInput
    func setupInitialState() {
    }
}
