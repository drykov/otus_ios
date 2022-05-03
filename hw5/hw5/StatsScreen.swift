//
//  StatsScreen.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import SwiftUI

struct StatsScreen: View {
    
    @EnvironmentObject var viewModel: SuffixViewModel
    
    var body: some View {
        VStack {
            Picker("Mode", selection: $viewModel.mode) {
                ForEach(Mode.allCases, id: \.self) { v in
                    Text(v.rawValue)
                        .tag(v)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Picker("Sort", selection: $viewModel.sort) {
                ForEach(Sort.allCases, id: \.self) { v in
                    Text(v.rawValue)
                        .tag(v)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            List(viewModel.sorted, id: \.self) { v in
                HStack {
                    Text(v)
                    Spacer()
                    Text(String(viewModel.suffixes[v] ?? 0))
                }
            }
            .listStyle(.plain)
        }
    }
}

struct StatsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        StatsScreen()
    }
}
