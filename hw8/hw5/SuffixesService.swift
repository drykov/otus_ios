//
//  SuffixesService.swift
//  hw5
//
//  Created by Dmitry Rykov on 11.07.2022.
//

import Foundation

class SuffixesService {
    
    static let shared = SuffixesService()
    
    private let queue = OperationQueue()
    
    init() {
        queue.qualityOfService = .background
        queue.maxConcurrentOperationCount = 8
    }
    
    func computeSuffixes(text: String, completion: @escaping ([String: Int], TimeInterval)->Void) {
        queue.addOperation {
            print("start \(text)")
            let start = Date.now
            var suffixes: [String: Int] = .init()
            text.split(separator: " ").forEach { word in
                SuffixSequence(word: String(word)).forEach { v in
                    if let count = suffixes[v] {
                        suffixes[v] = count + 1
                    } else {
                        suffixes[v] = 1
                    }
                }
            }
            print("end \(text)")
            completion(suffixes, Date.now.timeIntervalSince(start))
        }
    }
}
