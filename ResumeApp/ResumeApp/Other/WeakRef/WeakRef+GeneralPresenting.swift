//
//  WeakRef+GeneralPresenting.swift
//  ResumeApp
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//
extension WeakRef: GeneralPresenting where T: GeneralPresenting {
    
    func didSelect(row: Int) {
        object?.didSelect(row: row)
    }
    
}
