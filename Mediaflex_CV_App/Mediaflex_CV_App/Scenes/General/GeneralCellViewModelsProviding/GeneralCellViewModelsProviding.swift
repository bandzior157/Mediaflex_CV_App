//
//  GeneralCellViewModelsProviding.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol GeneralCellViewModelsProviding {
    func get(for cellTypes: [GeneralCellType]) -> [CellViewModel]
}
