//
//  Resume.swift
//  Mediaflex_CV_App
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct Resume {
    let name: String
    let imageUrl: String
    let role: String
    let summary: String
    let email: String
    let phone: String
    
    init(name: String = "", imageUrl: String = "", role: String = "", summary: String = "", email: String = "", phone: String = "") {
        self.name = name
        self.imageUrl = imageUrl
        self.role = role
        self.summary = summary
        self.email = email
        self.phone = phone
    }
}
