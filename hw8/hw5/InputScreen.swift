//
//  InputScreen.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import SwiftUI

struct InputScreen: View {
    
    @Binding var tab: Tab
    
    @EnvironmentObject var suffixViewModel: SuffixViewModel

    @EnvironmentObject var historyViewModel: HistoryViewModel

    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
            Button("Build") {
                guard !text.isEmpty else { return }
                historyViewModel.add(text: text)
                suffixViewModel.build(text: text)
                tab = .stats
            }
        }
        .padding()
    }
}

struct InputScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        InputScreen(tab: .constant(Tab.stats))
    }
}
