//
//  NewsViewModel.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import Foundation
import NewsNetworking

final class NewsViewModel: ObservableObject {
    
    private let from = "2022-03-01"
    private let sortBy = "publishedAt"
    private let language = "en"
    private let apiKey = "fcfe594b4b334e52a7cc24fb366c9caa"

    let sections = ["iOS", "Android"]
    @Published var currentSection: Int = 0 {
        didSet {
            articles = []
            page = 1
            loadPage()
        }
    }
    
    @Published var articles: [Article] = .init()
    var page = 1
    
    init() {
        loadPage()
    }
    
    func loadPage() {
        ArticlesAPI.everythingGet(q: sections[currentSection],
                                  from: from,
                                  sortBy: sortBy,
                                  language: language,
                                  apiKey: apiKey,
                                  page: page) { [weak self] list, error in
            self?.articles.append(contentsOf: list?.articles ?? [])
            self?.page += 1
        }
    }
}

