//
//  FakeResumeService.swift
//  ResumeApp
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class FakeResumeService {
    
    var delegate: ResumeServiceDelegate?
    
    private let resume = Resume(
        name: "Łukasz Bazior",
        imageUrl: "https://media-exp1.licdn.com/dms/image/C4D03AQF5fFNIFwTLLA/profile-displayphoto-shrink_200_200/0?e=1598486400&v=beta&t=DoVe9sBKssGRF01TyOX60xW754ABQ1fchbjhrOS1wXM",
        role: "iOS Developer",
        summary: "Some information about person. It could be summary of his pros and cons, experience, motivation or projects involed in. Should be visible in multiple lines.",
        email: "lukasz.bazior@gmail.com",
        phoneNumber: "+48 507 332 167",
        linkedInUrl: "https://www.linkedin.com/in/łukasz-bazior-91821798",
        gitHubUrl: "https://github.com/bandzior157",
        skillsGroups: [
            SkillsGroup(title: "Technical", skills: ["Swift", "Xcode", "CocoaPods"]),
            SkillsGroup(title: "Needless", skills: ["Drive licence"]),
            SkillsGroup(title: "Not visible skills", skills: [])
        ])

}

extension FakeResumeService: ResumeServicing {
    
    func fetchResume() {
        delegate?.didFetchResume(resume)
    }
    
}