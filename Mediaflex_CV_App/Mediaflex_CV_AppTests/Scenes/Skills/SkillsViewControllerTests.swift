//
//  SkillsViewControllerTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class SkillsViewControllerTests: XCTestCase {
    
    func test_title_passedByViewModel() {
        let sut = makeSUT()
        let viewModel = SkillsViewModel(title: "Title")
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.title, viewModel.title)
    }
    
    func test_tableViewRowsCount_equalsViewModelElementsCount() {
        let sut = makeSUT()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> SkillsViewController {
        SkillsViewController()
    }
}
