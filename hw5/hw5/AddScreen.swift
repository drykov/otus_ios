//
//  AddScreen.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import SwiftUI

struct AddScreen: View {
    
    @EnvironmentObject var viewModel: SuffixViewModel
    
    @State var word: String = ""
    
    var body: some View {
        HStack {
            TextField("Enter a word", text: $word)
                .textInputAutocapitalization(.never)
            Button("Add") {
                guard !word.isEmpty else { return }
                viewModel.add(word: word)
                word = ""
            }
        }
        .padding()
    }
}

struct AddScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        AddScreen()
    }
}
