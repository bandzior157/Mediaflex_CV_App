//
//  UrlBrowserHandler.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class UrlBrowserHandler {
    
    private let application: UIApplication
      
    init(application: UIApplication = UIApplication.shared) {
        self.application = application
    }
    
}

extension UrlBrowserHandler: UrlBrowserHandling {
    
    func open(urlString: String) throws {
        guard let urlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            throw UrlBrowserHandlingError.unknownError
        }
        
        guard let url = URL(string: urlString) else {
            throw UrlBrowserHandlingError.incorrectUrl
        }
        
        guard application.canOpenURL(url) else {
            throw UrlBrowserHandlingError.unableToOpen
        }
        
        application.open(url)
    }
    
}
