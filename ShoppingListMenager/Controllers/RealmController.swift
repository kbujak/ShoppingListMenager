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
    let serverPath = "http://52.211.55.147:9080"
    let realmPath = "realm://52.211.55.147:9080/~/Shop"
    var realm: Realm!
    
    private func checkIfUserAvailable(_ user: User) throws{
        let dbUsers = realm.objects(RealmUser.self)
        guard dbUsers.filter("login == %@", user.login).count < 1 else { throw DataBaseError.loginTakenError }
        guard dbUsers.filter("email == %@", user.email).count < 1 else { throw DataBaseError.emailTakenError }
    }
    
    private func addUserToUserDefaults(with login: String, _ email: String){
        UserDefaults.standard.set(true, forKey: "isLogInUser")
        UserDefaults.standard.set(login, forKey: "logInUserLogin")
        UserDefaults.standard.set(email, forKey: "logInUserEmail")
        UserDefaults.standard.synchronize()
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
                realm.add(LogInUsers(login: user.login))
            }
            self.addUserToUserDefaults(with: user.login, user.email)
        }else{
            throw DataBaseError.connectionError
        }
    }
    
    func logIn(with login: String, and password: String) throws {
        if let realm = self.realm{
            if let user = realm.objects(RealmUser.self).filter("login == %@", login).first{
                if user.password == password{
                    try! realm.write {
                        realm.add(LogInUsers(login: user.login))
                    }
                    self.addUserToUserDefaults(with: login, user.email)
                }else{
                    throw DataBaseError.improperPasswordError
                }
            }else{
                throw DataBaseError.userNotExistError
            }
        }else{
            throw DataBaseError.connectionError
        }
    }
    
    func logOut(with login: String) throws {
        if let realm = self.realm{
            if let logInuser = realm.objects(LogInUsers.self).filter("login == %@", login).first{
                try! realm.write {
                    realm.delete(logInuser)
                }
            }
        }else{
            throw DataBaseError.connectionError
        }
    }
    
    func getLogInUser() -> RealmUser?{
        if UserDefaults.standard.bool(forKey: "isLogInUser"){
            if let realm = self.realm{
                guard let login = UserDefaults.standard.string(forKey: "logInUserLogin") else { return nil }
                return realm.objects(RealmUser.self).filter("login == %@", login).first
            }
        }
        return nil
    }
    
    func addShoppingList(with list: ShoppingList){
        if let realm = self.realm{
            try! realm.write {
                realm.add(RealmShoppingList(shoppingList: list))
            }
        }
    }
    
    func getShoppingList() -> [RealmShoppingList]?{
        if let realm = self.realm{
            return Array(realm.objects(RealmShoppingList.self))
        }
        return nil
    }
}
