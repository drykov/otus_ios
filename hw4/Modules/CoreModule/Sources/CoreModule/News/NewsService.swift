//
//  NewsService.swift
//  
//
//  Created by Dmitry Rykov on 10.04.2022.
//

import Foundation
import NewsNetworking
import Combine

public protocol NewsService {
    
    func loadArticles(query: String, page: Int) -> Future<[NewsArticle]?, Error>
}

public class NewsServiceImpl: NewsService {

    private let from = "2022-04-01"
    private let sortBy = "publishedAt"
    private let language = "en"
    private let apiKey = "fcfe594b4b334e52a7cc24fb366c9caa"

    public init() {}
    
    public func loadArticles(query: String, page: Int) -> Future<[NewsArticle]?, Error> {
        Future { [weak self] promise in
            guard let self = self else { return }
            ArticlesAPI.everythingGet(q: query, from: self.from, sortBy: self.sortBy, language: self.language, apiKey: self.apiKey, page: page) { data, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data?.articles?.map { article in
                        NewsArticle(id: article.url, title: article.title, author: article.author, content: article.content)
                    }))
                }
            }
        }
    }
}
