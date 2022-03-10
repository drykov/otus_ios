//
//  OneScreen.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import SwiftUI

struct OneScreen: View {
    
    @Binding var selection: Tab
    @EnvironmentObject private var viewModel: ItemsViewModel
    
    var body: some View {
        Button("Open last item in list") {
            selection = .two
            viewModel.selectedItem = viewModel.items.last
        }
    }
}

struct OneScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        OneScreen(selection: .constant(.one))
    }
}
