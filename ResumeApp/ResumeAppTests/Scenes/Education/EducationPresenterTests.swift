//
//  EducationPresenterTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class EducationPresenterTests: XCTestCase {
    
    func test_viewModelProperConfiguration() {
        let sut = makeSUT()
        let view = MockEducationView()
        sut.view = view
        
        let january2000 = Date(timeIntervalSince1970: 949093397)
        let december2010 = Date(timeIntervalSince1970: 1293570197)
        
        let resume = Resume(education: [
            EducationRecord(
                schoolName: "school",
                schoolLogoUrlString: "school logo url",
                degree: "degree",
                specialization: "specialization",
                dateFrom: january2000,
                dateTo: december2010)])
        sut.setResume(resume)
        
        let expected = [EducationViewModel(cellViewModels: [CellViewModel(title: "school\ndegree, specialization", subtitle: "01.2000 - 12.2010", image: ImageViewModel(type: .url(string: "school logo url"), size: Size(width: 80, height: 80)), selectable: false)])]
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> EducationPresenter {
        EducationPresenter()
    }
    
}

class MockEducationView: EducationViewing {
    
    private(set) var updateViewModels = [EducationViewModel]()
    
    func update(viewModel: EducationViewModel) {
        updateViewModels.append(viewModel)
    }
    
}
