//
//  ContentView.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import SwiftUI

enum Tab {
    case add, stats
}

struct ContentView: View {
    
    @State private var tab = Tab.add
    
    var body: some View {
        TabView(selection: $tab) {
            AddScreen()
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
                .tag(Tab.add)
            StatsScreen()
                .tabItem {
                    Label("Stats", systemImage: "list.number")
                }
                .tag(Tab.stats)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
