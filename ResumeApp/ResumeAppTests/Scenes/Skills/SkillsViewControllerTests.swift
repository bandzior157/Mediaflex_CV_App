//
//  SkillsViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class SkillsViewControllerTests: XCTestCase {

    func test_tableViewSectionsCount_equalsViewModelSectionsCount() {
        let sut = makeSUT()
        let viewModel = SkillsPresentableModel(sections: [])
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.numberOfSections, 0)
        
        let twoSectionViewModel = SkillsPresentableModel(sections: [SectionViewModel(title: "first section", elements: []), SectionViewModel(title: "second section", elements: [])])
        sut.update(viewModel: twoSectionViewModel)
        XCTAssertEqual(sut.tableView.numberOfSections, 2)
    }
    
    func test_viewForHeaderInSection_forTableView() {
        let sut = makeSUT()
        let viewModel = SkillsPresentableModel(sections: [SectionViewModel(title: "section title", elements: [])])
        sut.update(viewModel: viewModel)
        
        let header = sut.tableView(sut.tableView, viewForHeaderInSection: 0) as? TableViewHeaderView
        XCTAssertNotNil(header)
        XCTAssertEqual(header?.textLabel.text, "section title")
    }
    
    func test_tableViewSectionElements_byViewModel() {
        let sut = makeSUT()
        let viewModel = SkillsPresentableModel(sections: [SectionViewModel(title: "first", elements: [CellViewModel(title: "f1"), CellViewModel(title: "f2")]), SectionViewModel(title: "second", elements: [CellViewModel(title: "s1")])])
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 1), 1)
        XCTAssertEqual(sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)).textLabel?.text, "f1")
        XCTAssertEqual(sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 0)).textLabel?.text, "f2")
        XCTAssertEqual(sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 1)).textLabel?.text, "s1")
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> SkillsViewController {
        let vc = SkillsViewController()
        vc.loadViewIfNeeded()
        return vc
    }
    
}
