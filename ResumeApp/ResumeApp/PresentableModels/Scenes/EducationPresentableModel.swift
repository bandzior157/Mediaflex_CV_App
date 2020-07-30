//
//  EducationPresentableModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct EducationPresentableModel {
    let cellPresentableModels: [CellPresentableModel]
}

extension EducationPresentableModel {
    
    init(resume: Resume) {
        self.cellPresentableModels = resume.education.map {
            CellPresentableModel(educationRecord: $0)
        }
    }
    
}
