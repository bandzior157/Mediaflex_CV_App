//
//  GeneralContract.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol GeneralViewing {
    func update(viewModel: GeneralPresentableModel)
}

protocol GeneralPresenting {
    func didSelect(row: Int)
}
