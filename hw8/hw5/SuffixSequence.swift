//
//  SuffixSequence.swift
//  hw5
//
//  Created by Dmitry Rykov on 03.05.2022.
//

import Foundation

struct SuffixSequence: Sequence {

    let word: String

    func makeIterator() -> SuffixIterator {
        SuffixIterator(word: word)
    }
}

struct SuffixIterator: IteratorProtocol {

    let word: String
    var offset: Int = 0
    
    mutating func next() -> String? {
        guard offset < word.count else { return nil }
        offset += 1
        return String(word.suffix(offset))
    }
}
