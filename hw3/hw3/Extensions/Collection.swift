//
//  Collection.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {

    func isLast(_ item: Element) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else { return false }
        return distance(from: itemIndex, to: endIndex) == 1
    }
}
