//
//  DateHelper.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation

class DateHelper{
    static var dateFormatter = DateFormatter()
    
    static func getStringFromDate(with format: DateFormatter.Style, date: Date) -> String{
        dateFormatter.dateStyle = format
        return dateFormatter.string(from: date)
    }
}
