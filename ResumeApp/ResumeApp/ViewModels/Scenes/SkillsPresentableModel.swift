//
//  SkillsPresentableModel.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct SkillsPresentableModel {
    
    let sections: [SectionPresentableModel]
    
}

extension SkillsPresentableModel {
    
    init(resume: Resume) {
        var tempSections = [SectionPresentableModel]()
        
        for skillsGroup in resume.skillsGroups {
            let elements = skillsGroup.skills.map { CellPresentableModel(title: $0) }
            if elements.isEmpty { continue }
            tempSections.append(SectionPresentableModel(title: skillsGroup.title, elements: elements))
        }
        
        self.sections = tempSections
    }
    
}
