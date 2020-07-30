//
//  EducationViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class EducationViewControllerTests: XCTestCase {
    
    func test_tableViewRowsCount_providedByPresentableModel() {
        let sut = makeSUT()
        let presentableModel = EducationPresentableModel(cellPresentableModels: [])
        
        sut.update(presentableModel: presentableModel)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        let presentableModel2 = EducationPresentableModel(cellPresentableModels: [CellPresentableModel(), CellPresentableModel()])
        sut.update(presentableModel: presentableModel2)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> EducationViewController {
        let sut = EducationViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
