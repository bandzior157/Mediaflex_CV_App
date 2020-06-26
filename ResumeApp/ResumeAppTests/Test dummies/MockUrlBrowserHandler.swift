//
//  MockUrlBrowserHandler.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockUrlBrowserHandler {
    
    private(set) var openedUrlStrings = [String]()
    
}

extension MockUrlBrowserHandler: UrlBrowserHandling {
    
    func open(urlString: String) throws {
        openedUrlStrings.append(urlString)
    }
    
}
