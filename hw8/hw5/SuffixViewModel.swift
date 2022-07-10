//
//  SuffixViewModel.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import Foundation
import WidgetKit

enum Mode: String, CaseIterable {
    case abc = "ABC", count = "Count"
}

enum Sort: String, CaseIterable {
    case asc = "Ascending", desc = "Descending"
}

class SuffixViewModel: ObservableObject {
    
    @Published var mode: Mode = .abc {
        didSet {
            update()
        }
    }
    
    @Published var sort: Sort = .asc {
        didSet {
            update()
        }
    }
    
    var suffixes: [String: Int] = .init()
    
    @Published var sorted: [String] = .init()
    
    func build(text: String) {
        suffixes.removeAll()
        text.split(separator: " ").forEach { word in
            SuffixSequence(word: String(word)).forEach { v in
                if let count = suffixes[v] {
                    suffixes[v] = count + 1
                } else {
                    suffixes[v] = 1
                }
            }
        }
        save()
        update()
    }
    
    private func save() {
        let array = suffixes.filter { suffix in
            suffix.key.count > 3
        }.map { suffix in
            Suffix(suffix: suffix.key, count: suffix.value)
        }
        if let encoded = try? JSONEncoder().encode(array) {
            UserDefaults(suiteName: userDefaultsGroup)?.set(encoded, forKey: suffixesKey)
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    private func update() {
        let isReversed = sort == .desc
        switch (mode) {
        case .abc:
            sorted = suffixes
                .sorted { compare($0.key, $1.key, isReversed) }
                .map { $0.key }
        case .count:
            sorted = suffixes
                .filter { $0.key.count == 3 }
                .sorted { compare($0.value, $1.value, isReversed) }
                .prefix(10)
                .map { $0.key }
        }
    }

    private func compare<T: Comparable>(_ a: T, _ b: T, _ isReversed: Bool = false) -> Bool {
        isReversed ? a > b : b > a
    }
}
