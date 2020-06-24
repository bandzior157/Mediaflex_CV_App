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

struct SectionViewModel {
    
    let title: String
    let elements: [CellViewModel]
    
}
