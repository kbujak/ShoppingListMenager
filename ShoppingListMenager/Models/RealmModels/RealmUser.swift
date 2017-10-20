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
    
    convenience init(login: String, password: String, email: String){
        self.init()
        self.login = login
        self.password = password
        self.email = email
    }
    
    convenience init(realmUser: RealmUser){
        self.init()
        self.login = realmUser.login
        self.password = realmUser.password
        self.email = realmUser.email
    }
}
