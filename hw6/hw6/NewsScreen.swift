//
//  NewsScreen.swift
//  hw6
//
//  Created by Dmitry Rykov on 16.07.2022.
//

import SwiftUI

struct NewsScreen: View {
    
    @ObservedObject private var viewModel = NewsViewModel()
    
    var body: some View {
        List(viewModel.articles) { article in
            VStack(alignment: .leading) {
                Text(article.title ?? "No title")
                Text(article.author ?? "No author")
                    .foregroundColor(Color.gray)
            }
        }
        .listStyle(.plain)
    }
}

struct NewsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NewsScreen()
    }
}
