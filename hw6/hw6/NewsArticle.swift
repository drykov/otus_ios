//
//  NewsArticle.swift
//  hw6
//
//  Created by Dmitry Rykov on 16.07.2022.
//

import Foundation

struct NewsArticle: Identifiable {
    
    let id: String
    let title: String?
    let author: String?

    public init(id: String, title: String? = nil, author: String? = nil) {
        self.id = id
        self.title = title
        self.author = author
    }
}
