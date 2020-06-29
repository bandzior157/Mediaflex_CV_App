//
//  WeakRef.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 29/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

final class WeakRef<T: AnyObject> {
    weak var object: T?
    
    init(_ object: T) {
        self.object = object
    }
}
