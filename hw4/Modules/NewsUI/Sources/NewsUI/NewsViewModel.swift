//
//  NewsViewModel.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import Foundation
import CoreModule
import Combine

final class NewsViewModel: ObservableObject {
    
    @Inject private var newsService: NewsService?

    let sections = ["iOS", "Android"]
    @Published var currentSection: Int = 0 {
        didSet {
            articles = []
            page = 1
            loadPage()
        }
    }
    
    @Published var articles: [NewsArticle] = .init()
    private var page = 1
    
    private var cancellable: AnyCancellable?
    
    init() {
        loadPage()
    }
    
    func loadPage() {
        cancellable = newsService?.loadArticles(query: sections[currentSection], page: page)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] list in
                self?.articles.append(contentsOf: list ?? [])
                self?.page += 1
            })
    }
}

