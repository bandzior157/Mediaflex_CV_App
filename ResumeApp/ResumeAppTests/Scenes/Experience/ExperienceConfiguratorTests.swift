//
//  ExperienceConfiguratorTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ExperienceConfiguratorTests: XCTestCase {
    
    private weak var weakViewController: ExperienceViewController?
    private weak var weakPresenter: ExperiencePresenter?
    private weak var weakRouter: Router?
    
    override func tearDown() {
        super.tearDown()
        XCTAssertNil(weakViewController)
        XCTAssertNil(weakPresenter)
        XCTAssertNil(weakRouter)
    }
    
    func test_configure() {
        let viewController = ExperienceViewController()
        let presenter = ExperiencePresenter()
        let router = Router()
        
        weakViewController = viewController
        weakPresenter = presenter
        weakRouter = router
        
        let sut = ExperienceConfigurator(viewController: viewController, presenter: presenter, router: router)
        sut.configure()
        
        XCTAssertNotNil(viewController.presenter)
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)
        XCTAssertNotNil(router.viewController)
    }
    
}
