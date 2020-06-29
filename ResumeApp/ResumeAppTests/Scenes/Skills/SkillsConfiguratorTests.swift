//
//  SkillsConfiguratorTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class SkillsConfiguratorTests: XCTestCase {
    
    private weak var weakViewController: SkillsViewController?
    private weak var weakPresenter: SkillsPresenter?
    
    override func tearDown() {
        super.tearDown()
        XCTAssertNil(weakViewController)
        XCTAssertNil(weakPresenter)
    }
    
    func test_configure() {
        let viewController = SkillsViewController()
        let presenter = SkillsPresenter()
        
        let sut = SkillsConfigurator(viewController: viewController, presenter: presenter)
        sut.configure()
        
        XCTAssertNotNil(presenter.view)
    }
    
}
