//
//  ArticleScreen.swift
//  hw2
//
//  Created by Dmitry Rykov on 27.03.2022.
//

import SwiftUI
import NewsNetworking

struct ArticleScreen: View {

    @EnvironmentObject var navigation: NavigationContainerViewModel

    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.title ?? "No title")
                    .font(.title)
                Text(article.author ?? "No author")
                    .padding(.vertical)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(article.content ?? "No text")
                Button("Back") {
                    navigation.pop()
                }
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

struct ArticleScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleScreen(article: Article(url: ""))
    }
}
