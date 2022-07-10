//
//  HistoryScreen.swift
//  hw5
//
//  Created by Dmitry Rykov on 10.07.2022.
//

import SwiftUI

struct HistoryScreen: View {
    
    @EnvironmentObject var viewModel: HistoryViewModel
    
    var body: some View {
        VStack {
            Button("Start") {
                viewModel.start()
            }
            List(viewModel.texts.indices, id: \.self) { i in
                HStack {
                    Text(viewModel.texts[i])
                    Spacer()
                    if let time = viewModel.times[i] {
                        Text(String(time))
                    } else {
                        Text("-")
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct HistoryScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        HistoryScreen()
    }
}
