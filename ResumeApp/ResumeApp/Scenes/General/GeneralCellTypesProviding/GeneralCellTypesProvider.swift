//
//  GeneralCellTypesProvider.swift
//  ResumeApp
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralCellTypesProvider: GeneralCellTypesProviding {
    func ordered(for resume: Resume) -> [GeneralCellType] {
        var output = [GeneralCellType]()
        
        output.append(.summary(resume.summary))
        output.append(.email(resume.email))
        output.append(.phoneNumber(resume.phoneNumber))
        
        if let linkedInUrl = resume.linkedInUrl {
            output.append(.linkedIn(linkedInUrl))
        }
        
        output.append(.gitHub(resume.gitHubUrl))

        return output
    }
}
