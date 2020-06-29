//
//  CompanyExperienceDetailPresenterTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class CompanyExperienceDetailPresenterTests: XCTestCase {
    
    func test_callUpdateOnView_onViewDidLoad() {
        let viewModel = CompanyExperienceDetailViewModel(companyLogoUrlString: "logo url", companyName: "company name", role: "role")
        let sut = makeSUT(viewModel)
        let view = MockCompanyExperienceDetailView()
        sut.view = view
        
        sut.viewDidLoad()
        
        XCTAssertEqual(view.updateViewModels, [viewModel])
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ viewModel: CompanyExperienceDetailViewModel) -> CompanyExperienceDetailPresenter {
        CompanyExperienceDetailPresenter(viewModel: viewModel)
    }
    
}

class MockCompanyExperienceDetailView: CompanyExperienceDetailViewing {
    
    private(set) var updateViewModels = [CompanyExperienceDetailViewModel]()
    
    func update(viewModel: CompanyExperienceDetailViewModel) {
        updateViewModels.append(viewModel)
    }
    
}
