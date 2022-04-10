//
//  NewsArticle.swift
//  
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import Foundation

public struct NewsArticle: Identifiable {
    
    public let id: String
    public let title: String?
    public let author: String?
    public let content: String?

    public init(id: String, title: String? = nil, author: String? = nil, content: String? = nil) {
        self.id = id
        self.title = title
        self.author = author
        self.content = content
    }
}
