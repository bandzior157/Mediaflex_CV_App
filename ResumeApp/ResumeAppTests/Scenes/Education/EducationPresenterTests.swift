//
//  EducationPresenterTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class EducationPresenterTests: XCTestCase {
    
    func test_viewPresentableProperConfiguration() {
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
        
        let expected = [EducationPresentableModel(cellPresentableModels: [CellPresentableModel(title: "school\ndegree, specialization", subtitle: "01.2000 - 12.2010", image: ImagePresentableModel(type: .url(string: "school logo url"), size: Size(width: 80, height: 80)), selectable: false)])]
        XCTAssertEqual(view.updatePresentableModels, expected)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> EducationPresenter {
        EducationPresenter()
    }
    
}

class MockEducationView: EducationViewing {
    
    private(set) var updatePresentableModels = [EducationPresentableModel]()
    
    func update(presentableModel: EducationPresentableModel) {
        updatePresentableModels.append(presentableModel)
    }
    
}
