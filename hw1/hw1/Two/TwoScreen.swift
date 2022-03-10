//
//  TwoScreen.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import SwiftUI

struct TwoScreen: View {
    
    @EnvironmentObject private var viewModel: ItemsViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.items, id: \.self) { item in
                NavigationLink(
                    destination: ItemScreen(item: item),
                    tag: item,
                    selection: $viewModel.selectedItem
                ) {
                    Text(item)
                }
            }
        }
    }
}

struct TwoScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        TwoScreen()
            .environmentObject(ItemsViewModel())
    }
}
