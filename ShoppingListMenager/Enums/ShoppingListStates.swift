//
//  ShoppingListStates.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation

enum ShoppingListStates: String{
    case created = "Available"
    case taken = "Taken"
    case finished = "Finished"
    
    var intValue: Int{
        switch self{
        case .created: return 0
        case .taken: return 1
        case .finished: return 2
        }
    }
    
    init(intValue: Int){
        switch intValue{
        case 0: self = .created
        case 1: self = .taken
        case 2: self = .finished
        default: self = .created
            
        }
    }
}
