//
//  RickAndMortyAppLoginRickAndMortyAppLoginPresenterTests.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import XCTest

class LoginPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: LoginInteractorInput {

    }

    class MockRouter: LoginRouterInput {

    }

    class MockViewController: LoginViewInput {

        func setupInitialState() {

        }
    }
}
