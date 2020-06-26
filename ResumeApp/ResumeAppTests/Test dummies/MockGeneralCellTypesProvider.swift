//
//  MockGeneralCellTypesProvider.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import ResumeApp

class MockGeneralCellTypesProvider {
    
    let generalCellTypes: [GeneralCellType]
    
    init(generalCellTypes: [GeneralCellType] = []) {
        self.generalCellTypes = generalCellTypes
    }
    
}

extension MockGeneralCellTypesProvider: GeneralCellTypesProviding {
    
    func ordered(for resume: Resume) -> [GeneralCellType] {
        generalCellTypes
    }
    
}
