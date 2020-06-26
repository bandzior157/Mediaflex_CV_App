//
//  MockGeneralCellTypesProvider.swift
//  Mediaflex_CV_AppTests
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import Mediaflex_CV_App

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
