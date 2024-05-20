//
//  SplashScreenSplashScreenConfiguratorTests.swift
//  RickAndMortyApp
//
//  Created by Cristian Peña on 20/05/2024.
//  Copyright © 2024 RickAndMortyApp. All rights reserved.
//

import XCTest

class SplashScreenModuleConfiguratorTests: XCTestCase {

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
        let viewController = SplashScreenViewControllerMock()
        let configurator = SplashScreenModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "SplashScreenViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SplashScreenPresenter, "output is not SplashScreenPresenter")

        let presenter: SplashScreenPresenter = viewController.output as! SplashScreenPresenter
        XCTAssertNotNil(presenter.view, "view in SplashScreenPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SplashScreenPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SplashScreenRouter, "router is not SplashScreenRouter")

        let interactor: SplashScreenInteractor = presenter.interactor as! SplashScreenInteractor
        XCTAssertNotNil(interactor.output, "output in SplashScreenInteractor is nil after configuration")
    }

    class SplashScreenViewControllerMock: SplashScreenViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
