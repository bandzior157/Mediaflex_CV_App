//
//  WeakRef+ExperiencePresenting.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

extension WeakRef: ExperiencePresenting where T: ExperiencePresenting {
    
    func didSelect(row: Int) {
        object?.didSelect(row: row)
    }
    
}
