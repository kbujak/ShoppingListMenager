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
    
    var realmController: RealmController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapGestureRecognizer()
        self.realmController = RealmController()
        // Do any additional setup after loading the view.
    }

    @IBAction func registerAction(_ sender: Any) {
        do{
            guard let login = RegisterHelper.checkLogin(for: loginTextField.text) else { return }
            guard let passw = RegisterHelper.checkPassw(passwTextField.text, with: retypePasswTextField.text) else { return }
            guard let email = RegisterHelper.checkEmail(for: emailTextField.text) else { return }
            try self.realmController.register(User(login: login, password: passw, email: email))
        }catch let registerError as RegisterError{
            
        }catch let dataBaseError as DataBaseError{
            
        }catch is Error{
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
