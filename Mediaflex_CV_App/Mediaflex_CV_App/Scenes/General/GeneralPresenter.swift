//
//  GeneralPresenter.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation
import UIKit

class GeneralPresenter: GeneralPresenting {
    
    var view: GeneralViewing?
    
    let cellTypesProvider: GeneralCellTypesProviding
    let cellViewModelsProvider: GeneralCellViewModelsProviding
    
    private var generalCellTypes: [GeneralCellType]?
    private var viewModel: GeneralViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            view?.update(viewModel: viewModel)
        }
    }
    
    init(cellTypesProvider: GeneralCellTypesProviding = GeneralCellTypesProvider(),
         cellViewModelsProvider: GeneralCellViewModelsProviding = GeneralCellViewModelsProvider()) {
        self.cellTypesProvider = cellTypesProvider
        self.cellViewModelsProvider = cellViewModelsProvider
    }
    
    func didSelect(row: Int) {
        do {switch generalCellTypes?[row] {
        case let .phoneNumber(value):
            try PhoneNumberHandler.call(phoneNumber: value)
        case let .linkedIn(value), let .gitHub(value):
            open(urlFromString: value)
        default:
            break
        }
        } catch let error {
            print("MY PRINT", error.localizedDescription)
        }
    }
    
    private func open(urlFromString url: String) {
        guard let newUrl = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        if let url = URL(string: newUrl), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

extension GeneralPresenter: ResumeSetting {
    
    func setResume(_ resume: Resume) {
        generalCellTypes = cellTypesProvider.ordered(for: resume)
        
        guard let generalCellTypes = generalCellTypes else { return }
        let elements = cellViewModelsProvider.get(for: generalCellTypes)
        let viewModel = GeneralViewModel(
            personViewViewModel: PersonViewViewModel(fullName: resume.name, imageUrl: resume.imageUrl, role: resume.role),
            elements: elements)
        
        self.viewModel = viewModel
    }
    
}
