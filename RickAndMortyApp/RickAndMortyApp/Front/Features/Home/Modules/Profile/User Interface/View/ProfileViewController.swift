//
//  ProfileProfileViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {

    var output: ProfileViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: ProfileViewInput
    func setupInitialState() {
    }
}
