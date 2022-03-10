//
//  ItemsViewModel.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import Foundation

final class ItemsViewModel: ObservableObject {
    
    @Published var items = [ "Item one", "Item two", "Item three", "Item four", "Item five"]
    @Published var selectedItem: String?
}
