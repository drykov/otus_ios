//
//  SectionViewModel.swift
//  
//
//  Created by Dmitry Rykov on 12.04.2022.
//

import Foundation
import CoreModule
import Combine

final class SectionViewModel: ObservableObject {
    
    @Inject private var newsService: NewsService?

    let query: String
    @Published var articles: [NewsArticle] = .init()
    var page = 1

    private var cancellable: AnyCancellable?

    init(query: String) {
        self.query = query
    }
    
    func loadPage() {
        cancellable = newsService?.loadArticles(query: query, page: page)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] list in
                self?.articles.append(contentsOf: list ?? [])
                self?.page += 1
            })
    }
}
