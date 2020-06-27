//
//  Delay.swift
//  ResumeAppTests
//
//  Created by Damian Tabański on 27/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class Delay {
    static func performAfter(seconds: Double, _ work: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            work()
        }
    }
}
