//
//  View.swift
//  hw2
//
//  Created by Dmitry Rykov on 27.03.2022.
//

import SwiftUI

extension View {
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
