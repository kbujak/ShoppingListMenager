//
//  UIViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func addTapGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func dissmissKeyboard(){
        self.view.endEditing(true)
    }
}
