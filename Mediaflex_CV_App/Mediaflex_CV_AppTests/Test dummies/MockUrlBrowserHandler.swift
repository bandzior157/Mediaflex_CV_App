//
//  MockUrlBrowserHandler.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

class MockUrlBrowserHandler {
    
    private(set) var openedUrlStrings = [String]()
    
}

extension MockUrlBrowserHandler: UrlBrowserHandling {
    
    func open(urlString: String) throws {
        openedUrlStrings.append(urlString)
    }
    
}
