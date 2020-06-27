//
//  ExperienceViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ExperienceViewControllerTests: XCTestCase {
    
    func test_tableViewRowsCount_providedByViewModel() {
        let sut = makeSUT()
        let viewModel = ExperienceViewModel(cellViewModels: [])
        
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        let viewModel2 = ExperienceViewModel(cellViewModels: [CellViewModel(), CellViewModel()])
        sut.update(viewModel: viewModel2)
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_tableViewCell_isRenderedByCellViewModel() {
        let sut = makeSUT()
        let cellViewModel = CellViewModel(subtitle: "S")
        let viewModel = ExperienceViewModel(cellViewModels: [cellViewModel])
        sut.update(viewModel: viewModel)

        Delay.performAfter(seconds: 10) {
            let cell = sut.tableView.cell(at: 0)
            XCTAssertNotNil(cell)
            XCTAssertEqual(cell?.textLabel?.text, "T")
            XCTAssertEqual(cell?.detailTextLabel?.text, "S")
            XCTAssertNotNil(cell?.imageView?.image)
            XCTAssertEqual(cell?.selectionStyle, .default)
        }
        
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> ExperienceViewController {
        let sut = ExperienceViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
}
