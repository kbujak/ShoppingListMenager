//
//  RealmShoppingList.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 17/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation
import RealmSwift

class RealmShoppingList: Object{
    @objc dynamic var date: Date!
    @objc dynamic var author: RealmUser!
    @objc dynamic var owner: RealmUser?
    @objc dynamic var state = 0
    var shoppingItemList = List<RealmShoppingItem>()
    
    convenience init(shoppingList: ShoppingList) {
        self.init()
        self.date = Date()
        self.author = RealmUser(user: shoppingList.author)
        self.state = shoppingList.state.intValue
        for shoppingItems in shoppingList.shoppingItemArray{
            shoppingItemList.append(RealmShoppingItem(item: shoppingItems))
        }
    }
}
