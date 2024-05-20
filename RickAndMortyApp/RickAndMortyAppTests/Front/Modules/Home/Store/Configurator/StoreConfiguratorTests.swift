//
//  StoreStoreConfiguratorTests.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 24/04/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import XCTest

class StoreModuleConfiguratorTests: XCTestCase {

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
        let viewController = StoreViewControllerMock()
        let configurator = StoreModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "StoreViewController is nil after configuration")
        XCTAssertTrue(viewController.output is StorePresenter, "output is not StorePresenter")

        let presenter: StorePresenter = viewController.output as! StorePresenter
        XCTAssertNotNil(presenter.view, "view in StorePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in StorePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is StoreRouter, "router is not StoreRouter")

        let interactor: StoreInteractor = presenter.interactor as! StoreInteractor
        XCTAssertNotNil(interactor.output, "output in StoreInteractor is nil after configuration")
    }

    class StoreViewControllerMock: StoreViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
