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
    let cellPresentableModelsProvider: GeneralCellPresentableModelsProviding
    let phoneNumberHandler: PhoneNumberHandling
    let urlBrowserHandler: UrlBrowserHandling
    var mailHandler: MailHandling?
    
    private var generalCellTypes: [GeneralCellType]?
    private var presentableModel: GeneralPresentableModel? {
        didSet {
            guard let presentableModel = presentableModel else { return }
            view?.update(presentableModel: presentableModel)
        }
    }
    
    init(cellTypesProvider: GeneralCellTypesProviding = GeneralCellTypesProvider(),
         cellPresentableModelsProvider: GeneralCellPresentableModelsProviding = GeneralCellPresentableModelsProvider(), phoneNumberHandler: PhoneNumberHandling = PhoneNumberHandler(), urlBrowserHandler: UrlBrowserHandling = UrlBrowserHandler()) {
        self.cellTypesProvider = cellTypesProvider
        self.cellPresentableModelsProvider = cellPresentableModelsProvider
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
        let elements = cellPresentableModelsProvider.get(for: generalCellTypes)
        
        var imagePresentableModel: ImagePresentableModel?
        if let imageUrlString = resume.imageUrl {
            imagePresentableModel = ImagePresentableModel(type: .url(string: imageUrlString), size: Size(width: 120, height: 120))
        }
        
        let personViewPresentableModel = PersonViewPresentableModel(fullName: resume.name, image: imagePresentableModel, role: resume.role)
        
        let presentableModel = GeneralPresentableModel(personViewPresentableModel: personViewPresentableModel, elements: elements)
        
        self.presentableModel = presentableModel
    }
    
}
