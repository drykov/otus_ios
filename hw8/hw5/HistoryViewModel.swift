//
//  HistoryViewModel.swift
//  hw5
//
//  Created by Dmitry Rykov on 10.07.2022.
//

import Foundation
import WidgetKit

class HistoryViewModel: ObservableObject {
       
    private let suffixesService: SuffixesService
    
    init(suffixesService: SuffixesService = SuffixesService.shared) {
        self.suffixesService = suffixesService
    }

    @Published var texts: [String] = .init()

    @Published var times: [Int: TimeInterval] = .init()

    func add(text: String) {
        texts.append(text)
    }
    
    func start() {
        for i in 0..<texts.count {
            suffixesService.computeSuffixes(text: texts[i], completion: { [weak self] _, time in
                DispatchQueue.main.async {
                    self?.times[i] = time
                }
            })
        }
    }
}
