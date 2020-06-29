//
//  ResumeServiceDelegate.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 21/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ResumeServiceDelegate {
    func didFetchResume(_ resume: Resume)
    func resumeServiceDidFail(with message: String)
}
