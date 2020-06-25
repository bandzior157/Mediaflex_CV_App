//
//  SkillsContract.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol SkillsViewing {
    func update(viewModel: SkillsViewModel)
}

protocol SkillsPresenting {
    func setResume(_ resume: Resume)
}
