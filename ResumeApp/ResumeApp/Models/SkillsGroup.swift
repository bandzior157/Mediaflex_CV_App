//
//  SkillsGroup.swift
//  ResumeApp
//
//  Created by Damian Tabański on 25/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct SkillsGroup {
    let title: String
    let skills: [String]
}

extension SkillsGroup: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case skills
    }
}
