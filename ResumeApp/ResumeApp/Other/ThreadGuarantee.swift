//
//  ThreadGuarantee.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 22/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class ThreadGuarantee {

    enum ThreadType {
        case main, background
    }

    static func guarantee(on threadType: ThreadType, _ work: @escaping () -> Void) {
        switch threadType {
        case .main: guaranteeMainThread { work() }
        case .background: guaranteeBackThread { work() }
        }
    }

    private static func guaranteeMainThread(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }

    private static func guaranteeBackThread(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            DispatchQueue.global(qos: .background).async(execute: work)
        } else {
            work()
        }
    }
    
}
