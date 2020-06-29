//
//  GeneralCellViewModelsProvider.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralCellViewModelsProvider: GeneralCellViewModelsProviding {
    
    func get(for cellTypes: [GeneralCellType]) -> [CellViewModel] {
        cellTypes.map(cellViewModel(for:))
    }
    
    private func cellViewModel(for generalCellType: GeneralCellType) -> CellViewModel {
        let size = Size(width: 40, height: 40)
        
        switch generalCellType {
        case let .summary(value):
            return CellViewModel(title: value)
        case let .phoneNumber(value):
            return CellViewModel(title: "Phone", subtitle: value, image: .init(type: .named(imageName: "phone"), size: size), selectable: true)
        case let .email(value):
            return CellViewModel(title: "Email", subtitle: value, image: .init(type: .named(imageName: "email"), size: size), selectable: true)
        case let .linkedIn(value):
            return CellViewModel(title: "LinkedIn", subtitle: value, image: .init(type: .named(imageName: "linkedIn"), size: size), selectable: true)
        case let .gitHub(value):
            return CellViewModel(title: "GitHub", subtitle: value, image: .init(type: .named(imageName: "github"), size: size), selectable: true)
        }
    }
    
}
