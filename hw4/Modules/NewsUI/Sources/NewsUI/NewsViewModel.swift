//
//  NewsViewModel.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import Foundation
import Combine

final class NewsViewModel: ObservableObject {

    let sections = [SectionViewModel(query: "iOS"), SectionViewModel(query: "Android")]
    @Published var currentSection: Int = 0 {
        didSet {
            let section = sections[currentSection]
            if section.articles.isEmpty {
                section.loadPage()
            }
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        for section in sections {
            section.objectWillChange
                .sink { [weak self] in
                    self?.objectWillChange.send()
                }
                .store(in: &cancellables)
        }
        sections[currentSection].loadPage()
    }
}

