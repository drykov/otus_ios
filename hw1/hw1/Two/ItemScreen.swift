//
//  ItemScreen.swift
//  hw1
//
//  Created by Dmitry Rykov on 10.03.2022.
//

import SwiftUI

struct ItemScreen: View {
    
    let item: String
    
    var body: some View {
        Text(item)
    }
}

struct ItemScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ItemScreen(item: "Item")
    }
}
