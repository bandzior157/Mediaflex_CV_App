//
//  Resume.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//


struct SkillsGroup {
    let title: String
    let skills: [String]
}


struct Resume {
    
    let name: String
    let imageUrl: String
    let role: String
    let summary: String
    let email: String
    let phone: String
    let linkedInUrl: String
    let github: String
    let skillsGroups: [SkillsGroup]
    
    init(name: String = "", imageUrl: String = "", role: String = "", summary: String = "", email: String = "", phone: String = "", linkedInUrl: String = "", github: String = "", skillsGroups: [SkillsGroup] = []) {
        self.name = name
        self.imageUrl = imageUrl
        self.role = role
        self.summary = summary
        self.email = email
        self.phone = phone
        self.linkedInUrl = linkedInUrl
        self.github = github
        self.skillsGroups = skillsGroups
    }
    
}
