//
//  NewsScreen.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import SwiftUI

struct NewsScreen: View {
    
    @EnvironmentObject private var viewModel: NewsViewModel

    var body: some View {
        VStack {
            Picker("Sections", selection: $viewModel.currentSection) {
                ForEach(0..<viewModel.sections.count) { index in
                    Text(viewModel.sections[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            List(viewModel.articles) { article in
                NewsCell(article: article)
                    .onAppear {
                        if viewModel.articles.isLast(article) {
                            viewModel.loadPage()
                        }
                    }
            }
            .listStyle(.plain)
        }
    }
}

struct NewsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NewsScreen()
            .environmentObject(NewsViewModel())
    }
}
