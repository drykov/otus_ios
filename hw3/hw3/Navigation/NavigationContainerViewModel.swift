//
//  NavigationContainerViewModel.swift
//  hw2
//
//  Created by Dmitry Rykov on 27.03.2022.
//

import SwiftUI

enum Transition {
    case none
    case custom(AnyTransition)
}

enum NavigationType {
    case pop
    case push
    case popToRoot
}

class NavigationContainerViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    func push(screenView: AnyView) {
        navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    func pop() {
        navigationType = .pop
        screenStack.pop()
    }
    
    func popToRoot() {
        navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
