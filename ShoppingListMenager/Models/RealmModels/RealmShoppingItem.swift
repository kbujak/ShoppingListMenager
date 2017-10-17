//
//  RealmShoppingItem.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 17/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation
import RealmSwift

class RealmShoppingItem: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var count: Int = 0
    
    convenience init(name: String, count: Int){
        self.init()
        self.name = name
        self.count = count
    }
    convenience init(item: ShoppingItem){
        self.init()
        self.name = item.name
        self.count = item.count
    }
}
