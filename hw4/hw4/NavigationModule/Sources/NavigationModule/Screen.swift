//
//  Screen.swift
//  hw2
//
//  Created by Dmitry Rykov on 27.03.2022.
//

import SwiftUI

struct Screen: Identifiable, Equatable {

    let id = UUID().uuidString
    let view: AnyView
    
    public static func == (lhs: Screen, rhs: Screen)-> Bool {
        return lhs.id == rhs.id
    }
}
