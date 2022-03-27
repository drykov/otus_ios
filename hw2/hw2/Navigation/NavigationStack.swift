//
//  NavigationStack.swift
//  hw2
//
//  Created by Dmitry Rykov on 27.03.2022.
//

import Foundation

struct NavigationStack {
    
    private var screens: [Screen] = .init()
    
    mutating func push(_ s: Screen) {
        screens.append(s)
    }
    
    mutating func pop() {
        _ = screens.popLast()
    }
    
    mutating func popToRoot() {
        screens.removeAll()
    }
    
    func top() -> Screen? {
        screens.last
    }
}
