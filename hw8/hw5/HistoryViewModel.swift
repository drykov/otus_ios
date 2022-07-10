//
//  HistoryViewModel.swift
//  hw5
//
//  Created by Dmitry Rykov on 10.07.2022.
//

import Foundation
import WidgetKit

class HistoryViewModel: ObservableObject {
       
    @Published var texts: [String] = .init()
    @Published var times: [Int: Double] = .init()

    func add(text: String) {
        texts.append(text)
    }
    
    func start() {
        for i in 0...texts.count {
            times[i] = Double.random(in: 0...5)
        }
    }
}
