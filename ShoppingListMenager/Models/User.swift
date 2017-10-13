//
//  User.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation

class User{
    var login: String
    var password: String
    var email: String
    
    init(login: String, password: String, email: String) {
        self.login = login
        self.password = password
        self.email = email
    }
}
