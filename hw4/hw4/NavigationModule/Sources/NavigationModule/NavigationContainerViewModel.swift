//
//  NavigationContainerViewModel.swift
//  hw2
//
//  Created by Dmitry Rykov on 27.03.2022.
//

import SwiftUI

public enum Transition {
    case none
    case custom(AnyTransition)
}

public enum NavigationType {
    case pop
    case push
    case popToRoot
}

public class NavigationContainerViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    public func push(screenView: AnyView) {
        navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    public func pop() {
        navigationType = .pop
        screenStack.pop()
    }
    
    public func popToRoot() {
        navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
