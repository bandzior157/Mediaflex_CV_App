//
//  GeneralPresenterTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class GeneralPresenterTests: XCTestCase {
    
    func test_setResume_callsViewUpdateWithGeneralPresentableModel() {
        let sut = makeSUT(GeneralCellTypesProvider())
        let view = MockGeneralView()
        let resume = Resume(name: "full name", imageUrl: "imageUrl", role: "role", summary: "summary body", email: "email@email.com", phoneNumber: "555666777", linkedInUrl: "linked in", gitHubUrl: "git hub")
        sut.view = view
        sut.setResume(resume)
        let size = Size(width: 40, height: 40)
        
        let summary = CellPresentableModel(title: "summary body", selectable: false)
        let email = CellPresentableModel(title: "Email", subtitle: "email@email.com", image: .init(type: .named(imageName: "email"), size: size), selectable: true)
        let phone = CellPresentableModel(title: "Phone", subtitle: "555666777", image: .init(type: .named(imageName: "phone"), size: size), selectable: true)
        let linkedIn = CellPresentableModel(title: "LinkedIn", subtitle: "linked in", image: .init(type: .named(imageName: "linkedIn"), size: size), selectable: true)
        let gitHub = CellPresentableModel(title: "GitHub", subtitle: "git hub", image: .init(type: .named(imageName: "github"), size: size), selectable: true)

        let expected = [GeneralPresentableModel(personViewPresentableModel: PersonViewPresentableModel(fullName: "full name", image: ImagePresentableModel(type: .url(string: "imageUrl"), size: Size(width: 120, height: 120)), role: "role"), elements: [summary, email, phone, linkedIn, gitHub])]
        XCTAssertEqual(view.updatePresentableModels, expected)
    }
    
    func test_setResume_callsViewUpdateWithGeneralPresentableModel_missingOptionals() {
        let sut = makeSUT(GeneralCellTypesProvider())
        let view = MockGeneralView()
        let resume = Resume(name: "full name", imageUrl: "imageUrl", role: "role")
        sut.view = view
        sut.setResume(resume)

        let expected = [GeneralPresentableModel(personViewPresentableModel: PersonViewPresentableModel(fullName: "full name", image: ImagePresentableModel(type: .url(string: "imageUrl"), size: Size(width: 120, height: 120)), role: "role"), elements: [])]
        XCTAssertEqual(view.updatePresentableModels, expected)
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
    
    func test_mailHandler_getCalled_onMailSelection() {
        let emailAddress = "test@mail.com"
        let mailHandler = MockMailHandler()
        let sut = GeneralPresenter(cellTypesProvider: MockGeneralCellTypesProvider(generalCellTypes: [.email(emailAddress)]))
        sut.mailHandler = mailHandler
        sut.setResume(Resume(email: emailAddress))
        sut.didSelect(row: 0)
        XCTAssertEqual(mailHandler.openedEmailAddresses, [emailAddress])
    }


    // MARK: - Helpers
    
    private func makeSUT(_ cellTypesProvider: GeneralCellTypesProviding = MockGeneralCellTypesProvider()) -> GeneralPresenter {
        GeneralPresenter(cellTypesProvider: cellTypesProvider)
    }
    
}

class MockMailHandler {
    
    private(set) var openedEmailAddresses = [String]()
    
}

extension MockMailHandler: MailHandling {
    
    func openMail(toRecipent recipent: String) {
        openedEmailAddresses.append(recipent)
    }

}
