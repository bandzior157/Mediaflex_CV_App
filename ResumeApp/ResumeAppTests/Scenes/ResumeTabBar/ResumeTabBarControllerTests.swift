//
//  ResumeViewControllerTests.swift
//  ResumeAppTests
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import ResumeApp

class ResumeTabBarControllerTests: XCTestCase {
    
    func test_initWithCoder_returnsNil() {
        XCTAssertNil(ResumeTabBarController(coder: NSCoder()))
    }
    
    func test_childrenCount_equals_one() {
        XCTAssertEqual(makeSUT().children.count, 4)
    }
    
    func test_firstChild_isGeneralViewController() {
        XCTAssertNotNil(makeSUT().children.first as? GeneralViewController)
    }
    
    func test_tabBarItems() {
        let sut = makeSUT()
        let tabBarItemsProperties = [
            TabBarItemProperties(title: "General", imageSystemName: "person.crop.circle"),
            TabBarItemProperties(title: "Skills", imageSystemName: "star.fill"),
            TabBarItemProperties(title: "Experience", imageSystemName: "briefcase.fill"),
            TabBarItemProperties(title: "Education", imageSystemName: "book.circle.fill")
        ]

        for index in 0...sut.children.count-1 {
            test_tabBarItem(sut.children[index].tabBarItem, has: tabBarItemsProperties[index])
        }
    }
    
    private func test_tabBarItem(_ tabBarItem: UITabBarItem, has properties: TabBarItemProperties) {
        XCTAssertEqual(tabBarItem.title, properties.title)
        XCTAssertEqual(tabBarItem.image, UIImage(systemName: properties.imageSystemName))
    }
    
    func test_presenter_viewDidLoad_getCalledOn_viewDidLoad() {
        let presenter = MockResumeTabBarPresenter()
        let sut = makeSUT()
        sut.presenter = presenter
        sut.viewDidLoad()
        XCTAssertEqual(presenter.viewDidLoadCounter, 1)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ generalView: UIViewController & GeneralViewing = GeneralViewController()) -> ResumeTabBarController {
        ResumeTabBarController(generalView: generalView)
    }
    
}


