//
//  PersonViewTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class PersonViewTests: XCTestCase {
    
    func test_initWithCoder_returnsNil() {
        XCTAssertNil(PersonView(coder: NSCoder()))
    }
    
    func test_updateSubviewsByViewModel() {
        let sut = makeSUT()
        sut.update(viewModel: PersonViewViewModel(fullName: "some name", image: ImagePresentableModel(type: .url(string: "some url"), size: Size(width: 0, height: 0)), role: "some role"))
        XCTAssertEqual(sut.nameLabel.text, "some name")
        XCTAssertEqual(sut.roleLabel.text, "some role")
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> PersonView {
        PersonView()
    }
    
}
