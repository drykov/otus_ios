//
//  ModalScreen.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import SwiftUI

struct ModalScreen: View {
    
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Text("This is modal screen")
            ActivityIndicator(isAnimating: .constant(true), style: .large)
            Button("Dismiss") {
                showModal.toggle()
            }
        }
    }
}

struct ModalScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ModalScreen(showModal: .constant(true))
    }
}
