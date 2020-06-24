//
//  GeneralViewControllerTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class GeneralViewControllerTests: XCTestCase {
    
    func test_personViewSubviews_areSet_onUpdateWithViewModel() {
        let sut = makeSUT()
        let viewModel = GeneralViewModel(name: "name", imageUrl: "https://docs-assets.developer.apple.com/published/06ba0eba91/63b0c95b-bf2f-4798-9cca-8a5e77631679.png", role: "role", elements: [])
        
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.personView.nameLabel.text, viewModel.name)
        XCTAssertEqual(sut.personView.roleLabel.text, viewModel.role)
        XCTAssertNotNil(sut.personView.imageView.image)
    }
    
    func test_tableViewElements_basedOnViewModelElements() {
        let sut = makeSUT()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        sut.update(viewModel: makeViewModel(elements: []))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        sut.update(viewModel: makeViewModel(elements: ["A"]))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
        
        sut.update(viewModel: makeViewModel(elements: ["A", "B", "C"]))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }
    

    // MARK: Helpers
    
    private func makeSUT() -> GeneralViewController {
        let sut = GeneralViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
    private func makeViewModel(elements: [String] = []) -> GeneralViewModel {
        GeneralViewModel(name: "", imageUrl: "", role: "", elements: elements)
    }
}
