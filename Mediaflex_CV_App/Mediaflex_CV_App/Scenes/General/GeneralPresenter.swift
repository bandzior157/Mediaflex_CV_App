//
//  GeneralPresenter.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation
import UIKit

class GeneralPresenter {
    
    var view: GeneralViewing?
    
    let cellTypesProvider: GeneralCellTypesProviding
    let cellViewModelsProvider: GeneralCellViewModelsProviding
    let phoneNumberHandler: PhoneNumberHandling
    let urlBrowserHandler: UrlBrowserHandling
    
    private var generalCellTypes: [GeneralCellType]?
    private var viewModel: GeneralViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            view?.update(viewModel: viewModel)
        }
    }
    
    init(cellTypesProvider: GeneralCellTypesProviding = GeneralCellTypesProvider(),
         cellViewModelsProvider: GeneralCellViewModelsProviding = GeneralCellViewModelsProvider(), phoneNumberHandler: PhoneNumberHandling = PhoneNumberHandler(), urlBrowserHandler: UrlBrowserHandling = UrlBrowserHandler()) {
        self.cellTypesProvider = cellTypesProvider
        self.cellViewModelsProvider = cellViewModelsProvider
        self.phoneNumberHandler = phoneNumberHandler
        self.urlBrowserHandler = urlBrowserHandler
    }
    
}

extension GeneralPresenter: GeneralPresenting {
    
    func didSelect(row: Int) {
        do {
            switch generalCellTypes?[row] {
            case let .phoneNumber(value):
                try phoneNumberHandler.call(phoneNumber: value)
            case let .linkedIn(value), let .gitHub(value):
                try urlBrowserHandler.open(urlString: value)
            default:
                break
            }
        } catch {

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
