//
//  EducationViewModel.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct EducationViewModel {
    let cellViewModels: [CellViewModel]
}

extension EducationViewModel {
    
    init(resume: Resume) {
        self.cellViewModels = resume.education.map {
            CellViewModel(educationRecord: $0)
        }
    }
    
}
