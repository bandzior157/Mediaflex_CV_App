//
//  EducationPresentableModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct EducationPresentableModel {
    let cellViewModels: [CellPresentableModel]
}

extension EducationPresentableModel {
    
    init(resume: Resume) {
        self.cellViewModels = resume.education.map {
            CellPresentableModel(educationRecord: $0)
        }
    }
    
}
