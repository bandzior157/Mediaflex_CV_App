//
//  GeneralCellPresentableModelsProviding.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol GeneralCellPresentableModelsProviding {
    func get(for cellTypes: [GeneralCellType]) -> [CellPresentableModel]
}
