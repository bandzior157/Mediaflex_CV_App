//
//  CompanyExperienceDetailViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class CompanyExperienceDetailViewControllerTests: XCTestCase {
    
    func test_updateCompanyExperienceViewModel_rendersSubviews() {
        let sut = makeSUT()
        let viewModel = CompanyExperienceDetailViewModel(companyLogoUrlString: "logo url string", companyName: "company name", role: "role")
        sut.update(viewModel: viewModel)
        
        XCTAssertEqual(sut.headerView.companyLabel.text, "company name")
        XCTAssertEqual(sut.headerView.roleLabel.text, "role")
    }
    
    func test_callPresenterViewDidLoad_onViewDidLoad() {
        let sut = CompanyExperienceDetailViewController()
        let presenter = MockCompanyExperienceDetailPresenter()
        sut.presenter = presenter
        
        sut.loadViewIfNeeded()
        XCTAssertEqual(presenter.viewDidLoadCounter, 1)
    }
 
    
    // MARK: - Helpers
    
    private func makeSUT() -> CompanyExperienceDetailViewController {
        let sut = CompanyExperienceDetailViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
