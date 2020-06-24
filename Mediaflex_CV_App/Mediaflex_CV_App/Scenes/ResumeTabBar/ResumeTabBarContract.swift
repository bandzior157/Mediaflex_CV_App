//
//  ResumeTabBarContract.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 19/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ResumeTabBarPresenting {
    func viewDidLoad()
}

struct ResumeTabBarViewModel {
    let general: GeneralViewModel
}

struct GeneralViewModel {
    let personViewViewModel: PersonViewViewModel
    let elements: [CellViewModel]
}

extension GeneralViewModel {
    init(resume: Resume) {
        self.personViewViewModel = PersonViewViewModel(fullName: resume.name, imageUrl: resume.imageUrl, role: resume.role)
        
        let summaryCellViewModel = CellViewModel(title: resume.summary)
        self.elements = [summaryCellViewModel]
    }
}

struct PersonViewViewModel {
    let fullName: String
    let imageUrl: String
    let role: String
}

struct CellViewModel {
    let title: String
    let imageName: String?
    let selectable: Bool
    
    init(title: String = "", imageName: String? = nil, selectable: Bool = true) {
        self.title = title
        self.imageName = imageName
        self.selectable = selectable
    }
}
