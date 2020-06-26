//
//  GeneralCellTypesProvider.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralCellTypesProvider: GeneralCellTypesProviding {
    func ordered(for resume: Resume) -> [GeneralCellType] {
        [.summary(resume.summary),
         .email(resume.email),
         .phoneNumber(resume.phone),
         .linkedIn(resume.linkedInUrl),
         .gitHub(resume.github)]
    }
}
