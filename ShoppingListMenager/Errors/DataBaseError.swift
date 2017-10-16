//
//  DataBaseErrors.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation

enum DataBaseError: String, Error{
    case connectionError = "Connection Error"
    case loginTaken = "Choosen login is taken"
    case emailTaken = "Choosen email is taken"
}
