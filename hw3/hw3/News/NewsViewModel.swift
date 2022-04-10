//
//  NewsViewModel.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import Foundation
import CoreModule

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
    
    init() {
        loadPage()
    }
    
    func loadPage() {
        newsService?.loadArticles(query: sections[currentSection], page: page) { [weak self] list, error in
            self?.articles.append(contentsOf: list ?? [])
            self?.page += 1
        }
    }
}

