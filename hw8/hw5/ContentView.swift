//
//  ContentView.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tab = Tab.input
    
    var body: some View {
        TabView(selection: $tab) {
            InputScreen(tab: $tab)
                .tabItem {
                    Label("Input", systemImage: "character.textbox")
                }
                .tag(Tab.input)
            StatsScreen()
                .tabItem {
                    Label("Stats", systemImage: "list.number")
                }
                .tag(Tab.stats)
            HistoryScreen()
                .tabItem {
                    Label("History", systemImage: "timer")
                }
                .tag(Tab.history)
        }
        .onOpenURL { url in
            switch url.absoluteString {
            case Tab.input.rawValue:
                tab = .input
            default:
                tab = .stats
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
