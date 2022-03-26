//
//  NewsCell.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import SwiftUI
import NewsNetworking

struct NewsCell: View {
    
    let article: Article
    
    var body: some View {
        Text(article.title ?? "No title")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(article: Article(url: ""))
    }
}
