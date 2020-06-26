//
//  CellViewModel.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 24/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct CellViewModel {
    
    let title: String
    let subtitle: String?
    let imageName: String?
    let selectable: Bool
    
    init(title: String = "", subtitle: String? = nil, imageName: String? = nil, selectable: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
        self.selectable = selectable
    }
    
}

#warning("extract below")
protocol CellViewModelHaving {
    var cellViewModel: CellViewModel { get }
}

enum GeneralCellType {
    case summary(_: String)
    case phoneNumber(_: String)
    case email(_: String)
    case linkedIn(_: String)
    case gitHub(_: String)
}

extension GeneralCellType: CellViewModelHaving {
    var cellViewModel: CellViewModel {
        switch self {
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
        default:
            return CellViewModel()
        }
    }
}
