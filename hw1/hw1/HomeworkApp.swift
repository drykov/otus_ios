//
//  HomeworkApp.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import SwiftUI

@main
struct HomeworkApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ItemsViewModel())
        }
    }
}
