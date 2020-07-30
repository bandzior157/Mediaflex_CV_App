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

    func test_tableViewSectionsCount_equalsPresentableModelSectionsCount() {
        let sut = makeSUT()
        let presentableModel = SkillsPresentableModel(sections: [])
        sut.update(presentableModel: presentableModel)
        XCTAssertEqual(sut.tableView.numberOfSections, 0)
        
        let twoSectionPresentableModel = SkillsPresentableModel(sections: [SectionPresentableModel(title: "first section", elements: []), SectionPresentableModel(title: "second section", elements: [])])
        sut.update(presentableModel: twoSectionPresentableModel)
        XCTAssertEqual(sut.tableView.numberOfSections, 2)
    }
    
    func test_viewForHeaderInSection_forTableView() {
        let sut = makeSUT()
        let presentableModel = SkillsPresentableModel(sections: [SectionPresentableModel(title: "section title", elements: [])])
        sut.update(presentableModel: presentableModel)
        
        let header = sut.tableView(sut.tableView, viewForHeaderInSection: 0) as? TableViewHeaderView
        XCTAssertNotNil(header)
        XCTAssertEqual(header?.textLabel.text, "section title")
    }
    
    func test_tableViewSectionElements_byPresentableModel() {
        let sut = makeSUT()
        let presentableModel = SkillsPresentableModel(sections: [SectionPresentableModel(title: "first", elements: [CellPresentableModel(title: "f1"), CellPresentableModel(title: "f2")]), SectionPresentableModel(title: "second", elements: [CellPresentableModel(title: "s1")])])
        sut.update(presentableModel: presentableModel)
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
