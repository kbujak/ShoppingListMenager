//
//  ShoppingItem.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation

class ShoppingItem{
    var name: String
    var count: Int
    
    init(name: String, count: Int){
        self.name = name
        self.count = count
    }
    
    init(item: RealmShoppingItem){
        self.name = item.name
        self.count = item.count
    }
}
