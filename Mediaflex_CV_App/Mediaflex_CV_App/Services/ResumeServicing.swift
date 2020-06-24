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
    
    private let resume = Resume(name: "Fake name", imageUrl: "https://media-exp1.licdn.com/dms/image/C4D03AQF5fFNIFwTLLA/profile-displayphoto-shrink_200_200/0?e=1598486400&v=beta&t=DoVe9sBKssGRF01TyOX60xW754ABQ1fchbjhrOS1wXM", role: "Fake role")
    
    func fetchResume() {
        delegate?.didFetchResume(resume)
    }
    
}
