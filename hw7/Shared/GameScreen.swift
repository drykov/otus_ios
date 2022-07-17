//
//  GameScreen.swift
//  hw7
//
//  Created by Dmitry Rykov on 17.07.2022.
//

import SwiftUI

struct GameScreen: View {
    
    let game: String
    
    var body: some View {
        Text(game)
    }
}

struct GameScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        GameScreen(game: "Test")
    }
}
