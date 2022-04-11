//
//  View.swift
//  hw2
//
//  Created by Dmitry Rykov on 27.03.2022.
//

import SwiftUI

extension View {
    
    public func toAnyView() -> AnyView {
        AnyView(self)
    }
}
