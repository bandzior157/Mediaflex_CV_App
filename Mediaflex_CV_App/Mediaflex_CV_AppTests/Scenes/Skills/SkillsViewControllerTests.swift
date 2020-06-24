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

    func test_tableViewSectionsCount_equalsViewModelSectionsCount() {
        let sut = makeSUT()
        let viewModel = SkillsViewModel(sections: [])
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.numberOfSections, 0)
        
        let twoSectionViewModel = SkillsViewModel(sections: [SectionViewModel(title: "first section", elements: []), SectionViewModel(title: "second section", elements: [])])
        sut.update(viewModel: twoSectionViewModel)
        XCTAssertEqual(sut.tableView.numberOfSections, 2)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> SkillsViewController {
        let vc = SkillsViewController()
        vc.loadViewIfNeeded()
        return vc
    }
    
}
