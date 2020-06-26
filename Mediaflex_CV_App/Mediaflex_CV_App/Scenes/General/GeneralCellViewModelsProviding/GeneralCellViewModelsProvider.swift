//
//  GeneralCellViewModelsProvider.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralCellViewModelsProvider: GeneralCellViewModelsProviding {
    
    func get(for cellTypes: [GeneralCellType]) -> [CellViewModel] {
        cellTypes.map(cellViewModel(for:))
    }
    
    private func cellViewModel(for generalCellType: GeneralCellType) -> CellViewModel {
        switch generalCellType {
        case let .summary(value):
            return CellViewModel(title: value)
        case let .phoneNumber(value):
            return CellViewModel(title: "Phone", subtitle: value, imageName: "phone", selectable: true)
        case let .email(value):
            return CellViewModel(title: "Email", subtitle: value, imageName: "email", selectable: true)
        case let .linkedIn(value):
            return CellViewModel(title: "LinkedIn", subtitle: value, imageName: "linkedIn", selectable: true)
        case let .gitHub(value):
            return CellViewModel(title: "GitHub", subtitle: value, imageName: "github", selectable: true)
        }
    }
    
}
