//
//  ResumeService.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class ResumeService {
    
    var delegate: ResumeServiceDelegate?
    
    private let urlString = "https://gist.githubusercontent.com/bandzior157/e5c090e5ca14346eea6dd024e50fe882/raw/309e3175d26f5b2bcd28f0e33578965032f34b23/cv.json"

}

extension ResumeService: ResumeServicing {
    
    @objc func fetchResume() {
        ThreadGuarantee.guarantee(on: .background) { [weak self] in
            guard let gitUrl = URL(string: self?.urlString ?? "") else { return }
            
            URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
                guard let data = data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let resume = try decoder.decode(Resume.self, from: data)
                    self?.delegate?.didFetchResume(resume)
                } catch {
                    self?.delegate?.resumeServiceDidFail(with: error.localizedDescription)
                }
            }.resume()
        }
    }
    
}
