//
//  ArticleCell.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import SwiftUI
import CoreModule

struct ArticleCell: View {
    
    let article: NewsArticle
    
    var body: some View {
        Text(article.title ?? "No title")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: NewsArticle(id: ""))
    }
}
