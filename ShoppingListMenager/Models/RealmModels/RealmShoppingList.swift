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
    
    convenience init(author: RealmUser, state: ShoppingListStates, shoppingItemList: [RealmShoppingItem]) {
        self.init()
        self.date = Date()
        self.author = author
        self.state = state.intValue
        self.shoppingItemList = List(shoppingItemList)
    }
}
