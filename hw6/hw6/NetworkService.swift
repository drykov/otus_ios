//
//  NetworkService.swift
//  hw6
//
//  Created by Dmitry Rykov on 16.07.2022.
//

import Foundation
import Combine
import NewsNetworking

class NetworkService {
    
    static let shared = NetworkService()
    
    private let from = "2022-07-01"
    private let sortBy = "publishedAt"
    private let language = "en"
    private let apiKey = "fcfe594b4b334e52a7cc24fb366c9caa"
    
    func loadArticles(query: String) -> Future<[NewsArticle], Error> {
        Future { [weak self] promise in
            guard let self = self else { return }
            ArticlesAPI.everythingGet(q: query, from: self.from, sortBy: self.sortBy, language: self.language, apiKey: self.apiKey) { data, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(data?.articles?.map { article in
                        NewsArticle(id: article.url, title: article.title, author: article.author)
                    } ?? []))
                }
            }
        }
    }
}
