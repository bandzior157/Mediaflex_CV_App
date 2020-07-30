//
//  ExperienceViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ExperienceViewControllerTests: XCTestCase {
    
    func test_tableViewRowsCount_providedByPresentableModel() {
        let sut = makeSUT()
        let presentableModel = ExperiencePresentableModel(cellPresentableModels: [])
        
        sut.update(presentableModel: presentableModel)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        let presentableModel2 = ExperiencePresentableModel(cellPresentableModels: [CellPresentableModel(), CellPresentableModel()])
        sut.update(presentableModel: presentableModel2)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_tableViewCellSelection_callsPresenterDidSelect() {
        let sut = makeSUT()
        let presenter = MockExperiencePresenter()
        sut.presenter = presenter
        
        let presentableModel = ExperiencePresentableModel(cellPresentableModels: [CellPresentableModel(), CellPresentableModel()])
        sut.update(presentableModel: presentableModel)
               
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 0))
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(presenter.selectedRows, [1, 0, 0])
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> ExperienceViewController {
        let sut = ExperienceViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
