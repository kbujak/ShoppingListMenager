//
//  ProfileViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 15/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "isLogInUser"){
            self.nameLabel.text = UserDefaults.standard.string(forKey: "logInUserLogin")
            self.emailLabel.text = UserDefaults.standard.string(forKey: "logInUserEmail")
        }
    }
    
    @IBAction func logoutAct(_ sender: Any) {
        try! delegate.realmController.logOut(with: self.nameLabel.text!)
        UserDefaults.standard.setValue(false, forKey: "isLogInUser")
        UserDefaults.standard.setValue(nil, forKey: "logInUserLogin")
        UserDefaults.standard.setValue(nil, forKey: "logInUserEmail")
        UserDefaults.standard.synchronize()
        performSegue(withIdentifier: "logoutSegue", sender: self)
    }
}
