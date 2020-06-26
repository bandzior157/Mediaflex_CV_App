//
//  GeneralPresenterTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class GeneralPresenterTests: XCTestCase {
    
    func test_setResume_callsViewUpdateWithGeneralViewModel() {
        let sut = makeSUT(GeneralCellTypesProvider())
        let view = MockGeneralView()
        let resume = Resume(name: "full name", imageUrl: "imageUrl", role: "role")
        sut.view = view
        sut.setResume(resume)
        
        let summary = CellViewModel(title: resume.summary, imageName: nil, selectable: false)
        let email = CellViewModel(title: "Email", subtitle: resume.email, imageName: "email", selectable: true)
        let phone = CellViewModel(title: "Phone", subtitle: resume.phoneNumber, imageName: "phone", selectable: true)
        let linkedIn = CellViewModel(title: "LinkedIn", subtitle: resume.linkedInUrl, imageName: "linkedIn", selectable: true)
        let gitHub = CellViewModel(title: "GitHub", subtitle: resume.gitHubUrl, imageName: "github", selectable: true)

        let expected = [GeneralViewModel(personViewViewModel: PersonViewViewModel(fullName: "full name", imageUrl: "imageUrl", role: "role"), elements: [summary, email, phone, linkedIn, gitHub])]
        XCTAssertEqual(view.updateViewModels, expected)
    }
    
    func test_phoneNumberHandler_getCalled_onPhoneSelection() {
        let phoneNumberHandler = MockPhoneNumberHandler()
        let sut = GeneralPresenter(cellTypesProvider: MockGeneralCellTypesProvider(generalCellTypes: [.phoneNumber("some phone number")]), phoneNumberHandler: phoneNumberHandler)
        sut.setResume(Resume(phoneNumber: "some phone number"))
        sut.didSelect(row: 0)
        XCTAssertEqual(phoneNumberHandler.calledPhoneNumbers, ["some phone number"])
    }
    
    func test_urlBrowserHandler_getCalled_onGitHubSelection() {
        let urlString = "some url string"
        let urlBrowserHandler = MockUrlBrowserHandler()
        let sut = GeneralPresenter(cellTypesProvider: MockGeneralCellTypesProvider(generalCellTypes: [.gitHub(urlString)]), urlBrowserHandler: urlBrowserHandler)
        sut.setResume(Resume(gitHubUrl: urlString))
        sut.didSelect(row: 0)
        XCTAssertEqual(urlBrowserHandler.openedUrlStrings, [urlString])
    }

    func test_urlBrowserHandler_getCalled_onLinkedInSelection() {
        let urlString = "some url string"
        let urlBrowserHandler = MockUrlBrowserHandler()
        let sut = GeneralPresenter(cellTypesProvider: MockGeneralCellTypesProvider(generalCellTypes: [.linkedIn(urlString)]), urlBrowserHandler: urlBrowserHandler)
        sut.setResume(Resume(linkedInUrl: urlString))
        sut.didSelect(row: 0)
        XCTAssertEqual(urlBrowserHandler.openedUrlStrings, [urlString])
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ cellTypesProvider: GeneralCellTypesProviding = MockGeneralCellTypesProvider()) -> GeneralPresenter {
        GeneralPresenter(cellTypesProvider: cellTypesProvider)
    }
    
}

class MockUrlBrowserHandler: UrlBrowserHandling {
    
    private(set) var openedUrlStrings = [String]()
    
    func open(urlString: String) throws {
        openedUrlStrings.append(urlString)
    }
    
}
