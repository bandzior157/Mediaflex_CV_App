//
//  ResumeServicing.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ResumeServicing {
    func fetchResume()
}

class FakeResumeService: ResumeServicing {
    
    var delegate: ResumeServiceDelegate?
    
    private let resume = Resume(name: "Fake name", imageUrl: "", role: "Fake role")
    
    func fetchResume() {
        delegate?.didFetchResume(resume)
    }
    
}
