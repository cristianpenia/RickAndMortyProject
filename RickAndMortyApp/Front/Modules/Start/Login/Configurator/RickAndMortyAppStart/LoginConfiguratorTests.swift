//
//  RickAndMortyAppStart/LoginRickAndMortyAppStart/LoginConfiguratorTests.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 22/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import XCTest

class Start/LoginModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = Start/LoginViewControllerMock()
        let configurator = Start/LoginModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "Start/LoginViewController is nil after configuration")
        XCTAssertTrue(viewController.output is Start/LoginPresenter, "output is not Start/LoginPresenter")

        let presenter: Start/LoginPresenter = viewController.output as! Start/LoginPresenter
        XCTAssertNotNil(presenter.view, "view in Start/LoginPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in Start/LoginPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is Start/LoginRouter, "router is not Start/LoginRouter")

        let interactor: Start/LoginInteractor = presenter.interactor as! Start/LoginInteractor
        XCTAssertNotNil(interactor.output, "output in Start/LoginInteractor is nil after configuration")
    }

    class Start/LoginViewControllerMock: Start/LoginViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
