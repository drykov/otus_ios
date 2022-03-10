//
//  ContentView.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import SwiftUI

enum Tab {
    case one, two, three
}

struct ContentView: View {
    
    @State private var selectedTab = Tab.one
    
    var body: some View {
        TabView(selection: $selectedTab) {
            OneScreen(selection: $selectedTab)
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag(Tab.one)
            TwoScreen()
                .tabItem {
                    Label("Two", systemImage: "list.number")
                }
                .tag(Tab.two)
            ThreeScreen()
                .tabItem {
                    Label("Three", systemImage: "text.bubble")
                }
                .tag(Tab.three)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
