//
//  GeneralConfiguratorTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class GeneralConfiguratorTests: XCTestCase {
    
    private weak var weakViewController: GeneralViewController?
    private weak var weakPresenter: GeneralPresenter?
    private weak var weakMailHandler: MailHandler?
    
    override func tearDown() {
        super.tearDown()
        XCTAssertNil(weakViewController)
        XCTAssertNil(weakPresenter)
        XCTAssertNil(weakMailHandler)
    }
    
    func test_configure() {
        let viewController = GeneralViewController()
        let presenter = GeneralPresenter()
        let mailHandler = MailHandler()
        
        weakViewController = viewController
        weakPresenter = presenter
        weakMailHandler = mailHandler
        
        let sut = GeneralConfigurator(viewController: viewController, presenter: presenter, mailHandler: mailHandler)
        sut.configure()
        
        XCTAssertNotNil(viewController.presenter)
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.mailHandler)
        XCTAssertNotNil(mailHandler.viewController)
    }
    
}
