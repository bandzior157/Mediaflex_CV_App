//
//  MainViewControllerTests.swift
//  Mediaflex_CV_AppTests
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import Mediaflex_CV_App

class MainViewControllerTests: XCTestCase {
    
    func test_initWithCoder_returnsNil() {
        XCTAssertNil(MainTabBarController(coder: NSCoder()))
    }
    
    func test_childrenCount_equals_one() {
        XCTAssertEqual(makeSUT().children.count, 1)
    }
    
    func test_firstChild_isGeneralViewController() {
        XCTAssertNotNil(makeSUT().children.first as? GeneralViewController)
    }
    
    func test_tabBarItems() {
        let sut = makeSUT()
        let tabBarItemsProperties = [TabBarItemProperties(title: "General", imageSystemName: "person.crop.circle")]
                
        for child in sut.children {
            test_tabBarItem(child.tabBarItem, has: tabBarItemsProperties[0])
        }
    }
    
    private func test_tabBarItem(_ tabBarItem: UITabBarItem, has properties: TabBarItemProperties) {
        XCTAssertEqual(tabBarItem.title, properties.title)
        XCTAssertEqual(tabBarItem.image, UIImage(systemName: properties.imageSystemName))
    }
    
    func test_presenter_viewDidLoad_getCalledOn_viewDidLoad() {
        let presenter = MockMainTabBarPresenter()
        let sut = makeSUT()
        sut.presenter = presenter
        sut.viewDidLoad()
        XCTAssertEqual(presenter.viewDidLoadCounter, 1)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ generalView: UIViewController & GeneralViewing = GeneralViewController()) -> MainTabBarController {
        MainTabBarController(generalView: generalView)
    }
    
    private let dummyGeneralViewModel = GeneralViewModel(name: "", imageUrl: "", role: "", summary: "", email: "", phone: "", linkedIn: "", github: "")
    
}


