//
//  LogInUsers.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation
import RealmSwift

class LogInUsers: Object{
    @objc dynamic var login = ""
    @objc dynamic var logInData: Date?
    
    convenience init(login: String){
        self.init()
        self.login = login
        self.logInData = Date()
    }
}
