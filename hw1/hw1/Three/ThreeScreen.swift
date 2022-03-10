//
//  ThreeScreen.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import SwiftUI

struct ThreeScreen: View {
    
    @State private var showModal = false
    
    var body: some View {
        Button("Show modal") {
            showModal.toggle()
        }
        .sheet(isPresented: $showModal) {
            ModalScreen(showModal: $showModal)
        }
    }
}

struct ThreeScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ThreeScreen()
    }
}
