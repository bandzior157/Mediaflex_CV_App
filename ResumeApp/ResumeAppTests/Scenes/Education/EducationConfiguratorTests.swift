//
//  EducationConfiguratorTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class EducationConfiguratorTests: XCTestCase {
    
    private weak var weakViewController: EducationViewController?
    private weak var weakPresenter: EducationPresenter?
    
    override func tearDown() {
        super.tearDown()
        XCTAssertNil(weakViewController)
        XCTAssertNil(weakPresenter)
    }
    
    func test_configure() {
        let viewController = EducationViewController()
        let presenter = EducationPresenter()
        
        weakViewController = viewController
        weakPresenter = presenter

        let sut = EducationConfigurator(viewController: viewController, presenter: presenter)
        sut.configure()
        
        XCTAssertNotNil(presenter.view)
    }
    
}
