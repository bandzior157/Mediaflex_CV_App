//
//  ResumeService.swift
//  ResumeApp
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class ResumeService {
    
    var delegate: ResumeServiceDelegate?
    
    private let urlString = "https://gist.githubusercontent.com/bandzior157/e5c090e5ca14346eea6dd024e50fe882/raw/538773464ba02bbe1a57f15c753282bb74ebefb6/cv.json"

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
