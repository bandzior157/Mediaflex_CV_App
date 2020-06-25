//
//  SkillsViewModel.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct SkillsViewModel {
    
    let sections: [SectionViewModel]
    
}

extension SkillsViewModel {
    
    init(resume: Resume) {
        var tempSections = [SectionViewModel]()
        
        for skillsGroup in resume.skillsGroups {
            let elements = skillsGroup.skills.map { CellViewModel(title: $0) }
            if elements.isEmpty { continue }
            tempSections.append(SectionViewModel(title: skillsGroup.title, elements: elements))
        }
        
        self.sections = tempSections
    }
    
}
