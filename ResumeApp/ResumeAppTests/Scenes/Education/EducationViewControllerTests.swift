//
//  EducationViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class EducationViewControllerTests: XCTestCase {
    
    func test_tableViewRowsCount_providedByViewModel() {
        let sut = makeSUT()
        let viewModel = EducationViewModel(cellViewModels: [])
        
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        let viewModel2 = EducationViewModel(cellViewModels: [CellViewModel(), CellViewModel()])
        sut.update(viewModel: viewModel2)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> EducationViewController {
        let sut = EducationViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
