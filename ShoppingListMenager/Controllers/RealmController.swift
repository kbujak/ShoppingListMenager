//
//  RealmController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 13/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import Foundation
import RealmSwift

class RealmController{
    let user = "kbujak421@gmail.com"
    let password = "test123"
    let serverPath = "http://34.240.121.55:9080"
    let realmPath = "realm://34.240.121.55:9080/~/ShoppingList"
    var realm: Realm!
    
    private func checkIfUserAvailable(_ user: User) throws{
        let dbUsers = realm.objects(RealmUser.self)
        guard dbUsers.filter("login == %@", user.login).count < 1 else { throw DataBaseError.loginTaken }
        guard dbUsers.filter("email == %@", user.email).count < 1 else { throw DataBaseError.emailTaken }
    }
    
    init(){
        SyncUser.logIn(with: .usernamePassword(username: user, password: password, register: false), server: URL(string: serverPath)!){
            user, error in
            guard let user = user else { return }
            DispatchQueue.main.async {
                let configuration = Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: self.realmPath)!))
                guard let realm = try? Realm(configuration: configuration) else { return }
                self.realm = realm
            }
        }
    }
    
    func register(_ user: User) throws{
        if let realm = self.realm{
            try self.checkIfUserAvailable(user)
            try! realm.write {
                realm.add(RealmUser(user: user))
            }
            UserDefaults.standard.set(true, forKey: "isLogInUser")
            UserDefaults.standard.set(user.login, forKey: "logInUserLogin")
            UserDefaults.standard.set(user.email, forKey: "logInUserEmail")
            UserDefaults.standard.synchronize()
        }else{
            throw DataBaseError.connectionError
        }
    }
}
