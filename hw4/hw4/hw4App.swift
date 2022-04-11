//
//  hw4App.swift
//  hw4
//
//  Created by Dmitry Rykov on 11.04.2022.
//

import SwiftUI
import CoreModule
import NavigationModule
import NewsUI

@main
struct hw4App: App {
    
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
