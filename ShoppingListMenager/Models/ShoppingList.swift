//
//  ShoppingList.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation

class ShoppingList{
    var date: Date
    var author: User
    var owner: User?
    var state: ShoppingListStates
    var shoppingItemArray: [ShoppingItem]
    
    init(user: User, shoppingItemArray: Array<ShoppingItem>) {
        self.date = Date()
        self.author = user
        self.state = .created
        self.shoppingItemArray = shoppingItemArray
    }
    
    init(realmShoppingList: RealmShoppingList) {
        self.date = realmShoppingList.date
        self.author = User(realmUser: realmShoppingList.author)
        self.state = ShoppingListStates(intValue: realmShoppingList.state)
        self.shoppingItemArray = []
        for shoppingItem in realmShoppingList.shoppingItemList{
            shoppingItemArray.append(ShoppingItem(item: shoppingItem))
        }
    }
}
