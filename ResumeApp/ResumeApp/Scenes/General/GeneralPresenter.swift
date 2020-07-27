//
//  GeneralPresenter.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation
import UIKit

class GeneralPresenter {
    
    var view: GeneralViewing?
    var alertPresenter: AlertPresenting?
    
    let cellTypesProvider: GeneralCellTypesProviding
    let cellViewModelsProvider: GeneralCellPresentableModelsProviding
    let phoneNumberHandler: PhoneNumberHandling
    let urlBrowserHandler: UrlBrowserHandling
    var mailHandler: MailHandling?
    
    private var generalCellTypes: [GeneralCellType]?
    private var presentableModel: GeneralPresentableModel? {
        didSet {
            guard let presentableModel = presentableModel else { return }
            view?.update(viewModel: presentableModel)
        }
    }
    
    init(cellTypesProvider: GeneralCellTypesProviding = GeneralCellTypesProvider(),
         cellViewModelsProvider: GeneralCellPresentableModelsProviding = GeneralCellPresentableModelsProvider(), phoneNumberHandler: PhoneNumberHandling = PhoneNumberHandler(), urlBrowserHandler: UrlBrowserHandling = UrlBrowserHandler()) {
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
            case let .email(recipent):
                try mailHandler?.openMail(toRecipent: recipent)
            default:
                break
            }
        } catch {
            alertPresenter?.show(message: error.localizedDescription)
        }
    }
    
}

extension GeneralPresenter: ResumeSetting {
    
    func setResume(_ resume: Resume) {
        generalCellTypes = cellTypesProvider.ordered(for: resume)
        
        guard let generalCellTypes = generalCellTypes else { return }
        let elements = cellViewModelsProvider.get(for: generalCellTypes)
        
        var imageViewModel: ImagePresentableModel?
        if let imageUrlString = resume.imageUrl {
            imageViewModel = ImagePresentableModel(type: .url(string: imageUrlString), size: Size(width: 120, height: 120))
        }
        
        let personViewViewModel = PersonViewViewModel(fullName: resume.name, image: imageViewModel, role: resume.role)
        
        let viewModel = GeneralPresentableModel(personViewViewModel: personViewViewModel, elements: elements)
        
        self.presentableModel = viewModel
    }
    
}
