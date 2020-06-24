//
//  FakeResumeService.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class FakeResumeService {
    
    var delegate: ResumeServiceDelegate?
    
    private let resume = Resume(
        name: "Fake name",
        imageUrl: "https://media-exp1.licdn.com/dms/image/C4D03AQF5fFNIFwTLLA/profile-displayphoto-shrink_200_200/0?e=1598486400&v=beta&t=DoVe9sBKssGRF01TyOX60xW754ABQ1fchbjhrOS1wXM",
        role: "Fake role",
        summary: "Some information about person. It could be summary of his pros and cons, experience, motivation or projects involed in. Should be visible in multiple lines.",
        email: "fake@gmail.com",
        phone: "+012 345 678 890",
        linkedInUrl: "linkedin.com/fakeAccount",
        github: "github.com/fakeAccount")

}

extension FakeResumeService: ResumeServicing {
    
    func fetchResume() {
        delegate?.didFetchResume(resume)
    }
    
}
