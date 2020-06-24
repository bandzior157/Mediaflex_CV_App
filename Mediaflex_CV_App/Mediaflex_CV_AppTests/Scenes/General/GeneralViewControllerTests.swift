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
        let personVM = PersonViewViewModel(fullName: "name", imageUrl: "https://docs-assets.developer.apple.com/published/06ba0eba91/63b0c95b-bf2f-4798-9cca-8a5e77631679.png", role: "role")
        let viewModel =
            GeneralViewModel(personViewViewModel: personVM, elements: [])
        
        sut.update(viewModel: viewModel)
        XCTAssertEqual(sut.personView.nameLabel.text, viewModel.personViewViewModel.fullName)
        XCTAssertEqual(sut.personView.roleLabel.text, viewModel.personViewViewModel.role)
        XCTAssertNotNil(sut.personView.imageView.image)
    }
    
    func test_tableViewElements_basedOnViewModelElements() {
        let sut = makeSUT()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        sut.update(viewModel: makeViewModel(elements: []))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        sut.update(viewModel: makeViewModel(elements: [dummyCellViewModel()]))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
        
        sut.update(viewModel: makeViewModel(elements: [dummyCellViewModel(), dummyCellViewModel(), dummyCellViewModel()]))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }
    
    func test_tableViewCell_text_isViewModelTitle() {
        let sut = makeSUT()
        let cellViewModel = CellViewModel(title: "First")
        sut.update(viewModel: makeViewModel(elements: [cellViewModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.textLabel?.text, "First")
    }
    
    func test_tableViewCell_image_renderedByViewModelImageName() {
        let sut = makeSUT()
        let cellViewModel = CellViewModel(imageName: "linkedIn")
        sut.update(viewModel: makeViewModel(elements: [cellViewModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNotNil(cell)
        XCTAssertNotNil(cell?.imageView?.image)
    }
    
    func test_tableViewCell_noImage_renderedByViewModelWithoutImageName() {
        let sut = makeSUT()
        let cellViewModel = CellViewModel(imageName: nil)
        sut.update(viewModel: makeViewModel(elements: [cellViewModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNotNil(cell)
        XCTAssertNil(cell?.imageView?.image)
    }
    
    func test_tableViewCell_defaultSelection_renderedByViewModelSelectable() {
        let sut = makeSUT()
        let cellViewModel = CellViewModel(selectable: true)
        sut.update(viewModel: makeViewModel(elements: [cellViewModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.selectionStyle.rawValue, UITableViewCell.SelectionStyle.default.rawValue)
    }
    
    func test_tableViewCell_noneSelection_renderedByViewModelNotSelectable() {
        let sut = makeSUT()
        let cellViewModel = CellViewModel(selectable: false)
        sut.update(viewModel: makeViewModel(elements: [cellViewModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell?.selectionStyle.rawValue, UITableViewCell.SelectionStyle.none.rawValue)
    }
    

    // MARK: Helpers
    
    private func makeSUT() -> GeneralViewController {
        let sut = GeneralViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
    private func makeViewModel(elements: [CellViewModel] = []) -> GeneralViewModel {
        GeneralViewModel(personViewViewModel: PersonViewViewModel(fullName: "", imageUrl: "", role: ""), elements: elements)
        
    }
    
    private func dummyCellViewModel() -> CellViewModel {
        CellViewModel(title: "")
    }

}

