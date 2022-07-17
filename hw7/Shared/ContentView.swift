//
//  ContentView.swift
//  Shared
//
//  Created by Dmitry Rykov on 17.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            PlayScreen()
                .tabItem {
                    Label("Play", systemImage: "play.fill")
                }
            SettingsScreen()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            LeaderboardScreen()
                .tabItem {
                    Label("Leaderboard", systemImage: "list.number")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
