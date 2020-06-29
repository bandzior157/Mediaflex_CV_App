//
//  Resume.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct Resume {
    
    let name: String
    let imageUrl: String?
    let role: String
    let summary: String
    let email: String
    let phoneNumber: String
    let linkedInUrl: String
    let gitHubUrl: String
    let skillsGroups: [SkillsGroup]
    let experience: [CompanyExperience]
    let education: [EducationRecord]
    
    init(name: String = "", imageUrl: String? = nil, role: String = "", summary: String = "", email: String = "", phoneNumber: String = "", linkedInUrl: String = "", gitHubUrl: String = "", skillsGroups: [SkillsGroup] = [], experience: [CompanyExperience] = [], education: [EducationRecord] = []) {
        self.name = name
        self.imageUrl = imageUrl
        self.role = role
        self.summary = summary
        self.email = email
        self.phoneNumber = phoneNumber
        self.linkedInUrl = linkedInUrl
        self.gitHubUrl = gitHubUrl
        self.skillsGroups = skillsGroups
        self.experience = experience
        self.education = education
    }
    
}

extension Resume: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case imageUrl = "photo_url"
        case role
        case summary
        case email
        case phoneNumber = "phone_number"
        case linkedInUrl = "linkedin_url"
        case gitHubUrl = "github_url"
        case skillsGroups = "skills_groups"
        case experience
        case education
    }
}
