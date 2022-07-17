//
//  PlayViewModel.swift
//  hw7
//
//  Created by Dmitry Rykov on 17.07.2022.
//

import Foundation

class PlayViewModel : ObservableObject {
    
    @Published var games = ["Game One", "Game Two", "Game Three"]
}
