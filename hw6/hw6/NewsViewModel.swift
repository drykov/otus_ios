//
//  NewsViewModel.swift
//  hw6
//
//  Created by Dmitry Rykov on 16.07.2022.
//

import Foundation
import Combine

final class NewsViewModel: ObservableObject {
    
    private let networkService = NetworkService.shared
    private let persistenceService = PersistenceService.shared

    @Published var articles: [NewsArticle] = .init()
    
    private var cancellable: AnyCancellable? = nil
    
    init() {
        cancellable = Publishers.Concatenate(
            prefix: persistenceService.loadArticles(),
            suffix: networkService.loadArticles(query: "ios")
                .handleEvents(receiveOutput: { [weak self] list in
                    self?.persistenceService.saveArticles(articles: list)
                })
        ).sink(receiveCompletion: { _ in }, receiveValue: { [weak self] list in
            self?.articles = list
        })
    }
}
