//
//  PlayScreen.swift
//  hw7
//
//  Created by Dmitry Rykov on 17.07.2022.
//

import SwiftUI

struct PlayScreen: View {
    
    @ObservedObject private var viewModel = PlayViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.games, id: \.self) { game in
                NavigationLink(destination: GameScreen(game: game)) {
                    Text(game)
                        .padding()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Play")
        }
    }
}

struct PlayScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        PlayScreen()
    }
}
