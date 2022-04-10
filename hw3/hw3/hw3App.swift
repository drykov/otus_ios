//
//  hw3App.swift
//  hw3
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import SwiftUI

@main
struct hw3App: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(transition: .custom(.slide)) {
                NewsScreen()
            }
        }
    }
}
