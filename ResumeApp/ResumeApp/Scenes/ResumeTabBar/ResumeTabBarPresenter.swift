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

    init(service: ResumeServicing) {
        self.service = service
    }
    
    func viewDidLoad() {
        service.fetchResume()
    }
    
}

extension ResumeTabBarPresenter: ResumeServiceDelegate {
    
    func didFetchResume(_ resume: Resume) {
        generalResumeSetter?.setResume(resume)
        skillsResumeSetter?.setResume(resume)
    }
    
}
