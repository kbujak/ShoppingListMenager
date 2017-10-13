//
//  RealmUser.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object{
    @objc dynamic var login = ""
    @objc dynamic var password = ""
    @objc dynamic var email = ""
    
    convenience init(user: User){
        self.init()
        self.login = user.login
        self.password = user.password
        self.email = user.email
    }
}
