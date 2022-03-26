//
//  hw2App.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import SwiftUI

@main
struct hw2App: App {
 
    var body: some Scene {
        WindowGroup {
            NewsScreen()
                .environmentObject(NewsViewModel())
        }
    }
}
