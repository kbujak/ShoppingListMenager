//
//  RegisterErrors.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation

enum RegisterError: String, Error{
    case invalidLogin = "Invalid Login"
    case invalidPassword = "Invalid password"
    case invalidEmail = "Invalid email"
}
