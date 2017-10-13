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
    let serverPath = "http://52.209.93.211:9080"
    let realmPath = "realm://52.209.93.211:9080/~/ShoppingList"
    var realm: Realm!
    
    private func checkIfUserAvailable(_ user: User) -> Bool{
        return false
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
            try! realm.write {
                realm.add(RealmUser(user: user))
            }
        }else{
            throw DataBaseError.connectionError
        }
    }
}
