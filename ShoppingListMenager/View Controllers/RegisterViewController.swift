//
//  RegisterViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwTextField: UITextField!
    @IBOutlet weak var retypePasswTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var realmController: RealmController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapGestureRecognizer()
        self.realmController = RealmController()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerAction(_ sender: Any) {
        do{
            guard let login = RegisterHelper.checkLogin(for: loginTextField.text) else { throw RegisterError.invalidLogin }
            guard let passw = RegisterHelper.checkPassw(passwTextField.text, with: retypePasswTextField.text) else { throw RegisterError.invalidPassword }
            guard let email = RegisterHelper.checkEmail(for: emailTextField.text) else { throw RegisterError.invalidEmail }
            let user = User(login: login, password: passw, email: email)
            try self.realmController.register(user)
            performSegue(withIdentifier: "sucessfullRegisterSegue", sender: self)
        }catch let registerError as RegisterError{
            self.errorLabel.isHidden = false
            self.errorLabel.text = registerError.rawValue
        }catch let dataBaseError as DataBaseError{
            errorLabel.isHidden = false
            self.errorLabel.text = dataBaseError.rawValue
        }catch is Error{
            errorLabel.isHidden = false
            self.errorLabel.text = "Unknown error"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
