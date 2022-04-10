//
//  NewsService.swift
//  
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import Foundation
import NewsNetworking

public protocol NewsService {
    
    func loadArticles(query: String, page: Int, completion: @escaping ([NewsArticle]?, Error?) -> Void)
}

public class NewsServiceImpl: NewsService {

    private let from = "2022-04-01"
    private let sortBy = "publishedAt"
    private let language = "en"
    private let apiKey = "fcfe594b4b334e52a7cc24fb366c9caa"

    public init() {}
    
    public func loadArticles(query: String, page: Int, completion: @escaping ([NewsArticle]?, Error?) -> Void) {
        ArticlesAPI.everythingGet(q: query, from: from, sortBy: sortBy, language: language, apiKey: apiKey, page: page) { data, error in
            completion(data?.articles?.map { article in
                NewsArticle(id: article.url, title: article.title, author: article.author, content: article.content)
            }, error)
        }
    }
}
