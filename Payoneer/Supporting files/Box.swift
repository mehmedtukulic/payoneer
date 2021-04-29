//
//  Box.swift
//  Payoneer
//
//  Created by Mehmed Tukulic on 29. 4. 2021..
//

import Foundation

// This class represents mvvm - boxing, it enables you to make variables as observables.

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
