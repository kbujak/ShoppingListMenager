//
//  ProfileViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 15/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "isLogInUser"){
            self.nameLabel.text = UserDefaults.standard.string(forKey: "logInUserLogin")
            self.surnameLabel.text = UserDefaults.standard.string(forKey: "logInUserEmail")
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        UserDefaults.standard.set(nil, forKey: "logInUserLogin")
        UserDefaults.standard.set(nil, forKey: "logInUserEmail")
    }
}
