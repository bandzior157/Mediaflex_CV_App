//
//  GeneralCellViewModelsProvider.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class GeneralCellViewModelsProvider: GeneralCellPresentableModelsProviding {
    
    func get(for cellTypes: [GeneralCellType]) -> [CellPresentableModel] {
        cellTypes.map(cellViewModel(for:))
    }
    
    private func cellViewModel(for generalCellType: GeneralCellType) -> CellPresentableModel {
        let size = Size(width: 40, height: 40)
        
        switch generalCellType {
        case let .summary(value):
            return CellPresentableModel(title: value)
        case let .phoneNumber(value):
            return CellPresentableModel(title: "Phone", subtitle: value, image: .init(type: .named(imageName: "phone"), size: size), selectable: true)
        case let .email(value):
            return CellPresentableModel(title: "Email", subtitle: value, image: .init(type: .named(imageName: "email"), size: size), selectable: true)
        case let .linkedIn(value):
            return CellPresentableModel(title: "LinkedIn", subtitle: value, image: .init(type: .named(imageName: "linkedIn"), size: size), selectable: true)
        case let .gitHub(value):
            return CellPresentableModel(title: "GitHub", subtitle: value, image: .init(type: .named(imageName: "github"), size: size), selectable: true)
        }
    }
    
}
