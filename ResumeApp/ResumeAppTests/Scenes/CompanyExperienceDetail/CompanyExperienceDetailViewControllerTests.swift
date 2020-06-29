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
        let viewModel = CompanyExperienceDetailViewModel(
            companyLogoUrlString: "logo url string",
            companyName: "company name",
            role: "role",
            dates: "dates",
            sections: [
                SectionViewModel(
                    title: "S1",
                    elements: [
                        CellViewModel(title: "S1E1"),
                        CellViewModel(title: "S1E2")
                    ]
                ),
                SectionViewModel(
                    title: "S2",
                    elements: [
                        CellViewModel(title: "S2E2")
                    ]
                )
            ]
        )
        
        let sut = makeSUT()
        sut.update(viewModel: viewModel)
        
        XCTAssertEqual(sut.headerView.companyLabel.text, "company name")
        XCTAssertEqual(sut.headerView.roleLabel.text, "role")
        XCTAssertEqual(sut.headerView.datesLabel.text, "dates")
        
        XCTAssertEqual(sut.tableView.numberOfSections, 2)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 1), 1)
        
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.textLabel?.text, "S1E1")
        
        let header = sut.tableView(sut.tableView, viewForHeaderInSection: 0) as? TableViewHeaderView
        XCTAssertNotNil(header)
        XCTAssertEqual(header?.textLabel.text, "S1")
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
