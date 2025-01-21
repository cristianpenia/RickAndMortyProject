//
//  CharaptersListViewController.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña Barrios on 21/01/2025.
//  Copyright © 2025 RickAndMortyApp. All rights reserved.
//

import UIKit

class CharaptersListViewController: UIViewController {

    var output: CharaptersListViewOutput!


    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }
}


// MARK: CharaptersListViewInput Methods

extension CharaptersListViewController: CharaptersListViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> CharaptersListModuleInput {
        return output as! CharaptersListModuleInput
    }
}
