//
//  PersonViewTests.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 24/06/2020.
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
        sut.update(viewModel: PersonViewViewModel(fullName: "some name", imageUrl: "some url", role: "some role"))
        XCTAssertEqual(sut.nameLabel.text, "some name")
        XCTAssertEqual(sut.roleLabel.text, "some role")
        XCTAssertNotNil(sut.imageView.image)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> PersonView {
        PersonView()
    }
    
}
