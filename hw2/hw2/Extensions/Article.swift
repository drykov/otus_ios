//
//  Article.swift
//  hw2
//
//  Created by Dmitry Rykov on 26.03.2022.
//

import Foundation
import NewsNetworking

extension Article: Identifiable {
    
    public var id: String { url }
}
