//
//  MainTabBarPresenter.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class MainTabBarPresenter: MainTabBarPresenting {
    
    private let service: ResumeServicing
    
    init(service: ResumeServicing) {
        self.service = service
    }
    
    func viewDidLoad() {
        service.fetchResume()
    }
    
}
