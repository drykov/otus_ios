//
//  hw3App.swift
//  hw3
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import SwiftUI
import CoreModule

@main
struct hw3App: App {
    
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(transition: .custom(.slide)) {
                NewsScreen()
            }
        }
    }
}
