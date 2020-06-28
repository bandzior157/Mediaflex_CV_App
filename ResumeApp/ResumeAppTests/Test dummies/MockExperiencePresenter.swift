//
//  MockExperiencePresenter.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockExperiencePresenter: ExperiencePresenting {
    
    private(set) var selectedRows = [Int]()
    
    func didSelect(row: Int) {
        selectedRows.append(row)
    }

}
