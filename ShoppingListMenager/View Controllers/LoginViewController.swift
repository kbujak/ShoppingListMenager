//
//  ViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var realmController: RealmController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapGestureRecognizer()
        DispatchQueue.main.async {
            self.realmController = RealmController()
        }
    }

    @IBAction func logInAct(_ sender: Any) {
        do{
            guard let login = loginTextField.text else { return }
            guard let passw = passwTextField.text else { return }
            try self.realmController.logIn(with: login, and: passw)
            performSegue(withIdentifier: "loginSegue", sender: self)
        }catch let dbError as DataBaseError{
            self.errorLabel.isHidden = false
            self.errorLabel.text = dbError.rawValue
        }catch is Error{
            self.errorLabel.isHidden = false
            self.errorLabel.text = "Unknown error"
        }
    }
    
    @IBAction func unwindToLoginViewController(for unwindSegue: UIStoryboardSegue) {}
}

