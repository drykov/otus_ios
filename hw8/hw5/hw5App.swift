//
//  hw5App.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import SwiftUI

@main
struct hw5App: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SuffixViewModel())
                .environmentObject(HistoryViewModel())
        }
    }
}
