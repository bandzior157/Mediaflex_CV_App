//
//  GeneralCellTypesProvider.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralCellTypesProvider: GeneralCellTypesProviding {
    func ordered(for resume: Resume) -> [GeneralCellType] {
        var output = [GeneralCellType]()
        
        if let summary = resume.summary {
            output.append(.summary(summary))
        }
        
        if let email = resume.email {
            output.append(.email(email))
        }
        
        if let phoneNumber = resume.phoneNumber {
            output.append(.phoneNumber(phoneNumber))
        }
        
        if let linkedInUrl = resume.linkedInUrl {
            output.append(.linkedIn(linkedInUrl))
        }
        
        if let gitHubUrl = resume.gitHubUrl {
            output.append(.gitHub(gitHubUrl))
        }

        return output
    }
}
