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
        let viewModel = GeneralViewModel(name: "name", imageUrl: "https://docs-assets.developer.apple.com/published/06ba0eba91/63b0c95b-bf2f-4798-9cca-8a5e77631679.png", role: "role", summary: "", email: "", phone: "", linkedIn: "", github: "")
        
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.personView.nameLabel.text, viewModel.name)
        XCTAssertEqual(sut.personView.roleLabel.text, viewModel.role)
        XCTAssertNotNil(sut.personView.imageView.image)
    }
    
    func test_tableViewElements_basedOnViewModelElements() {
        let sut = makeSUT()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
    }
    

    // MARK: Helpers
    
    private func makeSUT() -> GeneralViewController {
        GeneralViewController()
    }
    
}
