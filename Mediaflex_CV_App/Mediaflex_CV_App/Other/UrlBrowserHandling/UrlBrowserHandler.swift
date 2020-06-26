//
//  UrlBrowserHandler.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class UrlBrowserHandler: UrlBrowserHandling {
    static func open(urlString: String) throws {
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            throw UrlBrowserHandlingError.unknownError
        }
        
        guard let url = URL(string: urlString) else {
            throw UrlBrowserHandlingError.incorrectUrl
        }
        
        guard UIApplication.shared.canOpenURL(url) else {
            throw UrlBrowserHandlingError.unableToOpen
        }
        
        UIApplication.shared.open(url)
    }
}
