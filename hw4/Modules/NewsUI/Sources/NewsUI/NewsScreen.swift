//
//  NewsScreen.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import SwiftUI
import NavigationModule

public struct NewsScreen: View {
    
    @EnvironmentObject var navigation: NavigationContainerViewModel

    @ObservedObject private var viewModel = NewsViewModel()
    
    public init() {}

    public var body: some View {
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
                ArticleCell(article: article)
                    .onTapGesture {
                        navigation.push(screenView: ArticleScreen(article: article).toAnyView())
                    }
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
    }
}
