//
//  ResumeService.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class ResumeService {
    
    var delegate: ResumeServiceDelegate?
    
    private let urlString = "https://gist.githubusercontent.com/bandzior157/e5c090e5ca14346eea6dd024e50fe882/raw/d2022c22f627609b2b811b532a94d9ff90c6a2dc/cv.json"

}

extension ResumeService: ResumeServicing {
    
    func fetchResume() {
        guard let gitUrl = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let resume = try JSONDecoder().decode(Resume.self, from: data)
                self.delegate?.didFetchResume(resume)
            } catch {
                
            }
        }.resume()
    }
    
}
