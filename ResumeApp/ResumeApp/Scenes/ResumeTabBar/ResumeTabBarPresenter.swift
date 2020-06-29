//
//  ResumeTabBarPresenter.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class ResumeTabBarPresenter: ResumeTabBarPresenting {
    
    private let service: ResumeServicing
    
    var generalResumeSetter: ResumeSetting?
    var skillsResumeSetter: ResumeSetting?
    var experienceResumeSetter: ResumeSetting?
    var educationResumeSetter: ResumeSetting?
    
    init(service: ResumeServicing) {
        self.service = service
    }
    
    func viewDidLoad() {
        service.fetchResume()
    }
    
}

extension ResumeTabBarPresenter: ResumeServiceDelegate {
    
    func didFetchResume(_ resume: Resume) {
        let resumeSetters = [generalResumeSetter, skillsResumeSetter, experienceResumeSetter, educationResumeSetter]
        
        resumeSetters.forEach {
            $0?.setResume(resume)
        }
    }
    
}
