//
//  MenuTabBarMenuTabBarConfiguratorTests.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import XCTest

class MenuTabBarModuleConfiguratorTests: XCTestCase {

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
        let viewController = MenuTabBarViewControllerMock()
        let configurator = MenuTabBarModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "MenuTabBarViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MenuTabBarPresenter, "output is not MenuTabBarPresenter")

        let presenter: MenuTabBarPresenter = viewController.output as! MenuTabBarPresenter
        XCTAssertNotNil(presenter.view, "view in MenuTabBarPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MenuTabBarPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MenuTabBarRouter, "router is not MenuTabBarRouter")

        let interactor: MenuTabBarInteractor = presenter.interactor as! MenuTabBarInteractor
        XCTAssertNotNil(interactor.output, "output in MenuTabBarInteractor is nil after configuration")
    }

    class MenuTabBarViewControllerMock: MenuTabBarViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
