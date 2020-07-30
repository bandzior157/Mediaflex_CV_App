//
//  GeneralViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class GeneralViewControllerTests: XCTestCase {
    
    private let dummySize = Size(width: 0, height: 0)
    
    func test_personViewSubviews_areSet_onUpdateWithPresentableModel() {
        let sut = makeSUT()
        let personViewPresentableModel = PersonViewPresentableModel(fullName: "name", image: ImagePresentableModel(type: .url(string: "https://docs-assets.developer.apple.com/published/06ba0eba91/63b0c95b-bf2f-4798-9cca-8a5e77631679.png"), size: Size(width: 0, height: 0)), role: "role")
        let presentableModel =
            GeneralPresentableModel(personViewPresentableModel: personViewPresentableModel, elements: [])
        
        sut.update(presentableModel: presentableModel)
        XCTAssertEqual(sut.personView.nameLabel.text, presentableModel.personViewPresentableModel.fullName)
        XCTAssertEqual(sut.personView.roleLabel.text, presentableModel.personViewPresentableModel.role)
    }
    
    func test_tableViewElements_basedOnPresentableModelElements() {
        let sut = makeSUT()
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        sut.update(presentableModel: makePresentableModel(elements: []))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
        
        sut.update(presentableModel: makePresentableModel(elements: [dummyCellPresentableModel()]))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
        
        sut.update(presentableModel: makePresentableModel(elements: [dummyCellPresentableModel(), dummyCellPresentableModel(), dummyCellPresentableModel()]))
        XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 3)
    }
    
    func test_renderedCell_styleSubtitle() {
        let sut = makeSUT()
        sut.update(presentableModel: makePresentableModel(elements: [CellPresentableModel()]))
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.cellStyle, .subtitle)
    }
    
    func test_tableViewCell_text_isPresentableModelTitle() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(title: "First")
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertEqual(cell?.textLabel?.text, "First")
    }
    
    func test_tableViewCell_image_renderedByPresentableModelImageName() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(image: .init(type: .named(imageName: "phone"), size: dummySize))
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNotNil(cell?.imageView?.image)
    }
    
    func test_tableViewCell_noImage_renderedByPresentableModelWithoutImageName() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(image: nil)
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNil(cell?.imageView?.image)
    }
    
    func test_tableViewCell_defaultSelection_renderedByPresentableModelSelectable() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(selectable: true)
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertEqual(cell?.selectionStyle, .default)
    }
    
    func test_tableViewCell_noneSelection_renderedByPresentableModelNotSelectable() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(selectable: false)
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertEqual(cell?.selectionStyle, UITableViewCell.SelectionStyle.none)
    }
    
    func test_tableViewCell_subtitle_fromPresentableModel() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(subtitle: "text")
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertEqual(cell?.detailTextLabel?.text, "text")
    }
    
    func test_tableViewCell_defaultNoSubtitle() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel()
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertNil(cell?.detailTextLabel?.text)
    }
    
    func test_tableViewCell_hasChevron_whenSelectable() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(selectable: true)
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertEqual(cell?.accessoryType, UITableViewCell.AccessoryType.disclosureIndicator)
    }
    
    func test_tableViewCell_hasNoChevron_whenNotSelectable() {
        let sut = makeSUT()
        let cellPresentableModel = CellPresentableModel(selectable: false)
        sut.update(presentableModel: makePresentableModel(elements: [cellPresentableModel]))
                
        let cell = sut.tableView.cell(at: 0)
        XCTAssertEqual(cell?.accessoryType, UITableViewCell.AccessoryType.none)
    }
    
    func test_tableViewDidSelectCell_callsPresenterDidSelectRow() {
        let sut = makeSUT()
        let presenter = MockGeneralPresenter()
        sut.presenter = presenter
        
        sut.update(presentableModel: makePresentableModel(elements: [CellPresentableModel(), CellPresentableModel()]))
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 1, section: 0))
        XCTAssertEqual(presenter.selectedRows, [1])
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(presenter.selectedRows, [1, 0])
        
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(presenter.selectedRows, [1, 0, 0])
    }
    
    
    // MARK: Helpers
    
    private func makeSUT() -> GeneralViewController {
        let sut = GeneralViewController()
        sut.loadViewIfNeeded()
        return sut
    }
    
    private func makePresentableModel(elements: [CellPresentableModel] = []) -> GeneralPresentableModel {
        GeneralPresentableModel(personViewPresentableModel: PersonViewPresentableModel(fullName: "", image: nil, role: ""), elements: elements)
    }
    
    private func dummyCellPresentableModel() -> CellPresentableModel {
        CellPresentableModel(title: "")
    }

}
