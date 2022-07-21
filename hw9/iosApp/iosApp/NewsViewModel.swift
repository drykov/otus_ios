//
//  NewsViewModel.swift
//  iosApp
//
//  Created by Dmitry Rykov on 21.07.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import shared

class NewsViewModel: ObservableObject {
    
    private let newsService = NewsService()
    
    @Published var news: [NewsItem] = .init()
    
    init() {
        newsService.loadNews(sources: "techcrunch") { [weak self] result, error in
            if let news = result {
                DispatchQueue.main.async {
                    self?.news = news
                }
            }
        }
    }
}
