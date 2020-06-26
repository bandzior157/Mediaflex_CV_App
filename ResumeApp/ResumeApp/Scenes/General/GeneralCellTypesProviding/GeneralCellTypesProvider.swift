//
//  GeneralCellTypesProvider.swift
//  ResumeApp
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralCellTypesProvider: GeneralCellTypesProviding {
    func ordered(for resume: Resume) -> [GeneralCellType] {
        [.summary(resume.summary),
         .email(resume.email),
         .phoneNumber(resume.phoneNumber),
         .linkedIn(resume.linkedInUrl),
         .gitHub(resume.gitHubUrl)]
    }
}
