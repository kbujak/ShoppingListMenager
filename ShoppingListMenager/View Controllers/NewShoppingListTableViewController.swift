//
//  NewShoppingListTableViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit

class NewShoppingListTableViewController: UITableViewController {

    var shoppingItems = [ShoppingItem]()
    var realmController: RealmController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTapGestureRecognizer()
        DispatchQueue.main.async {
            self.realmController = RealmController()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newShoppingCellId", for: indexPath) as! NewShoppingListTableViewCell
        let shoppingItem = shoppingItems[indexPath.row]
        cell.nameLabel.text = shoppingItem.name
        cell.countLabel.text = String(describing: shoppingItem.count)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    @IBAction func saveNewShoppingList(_ sender: Any) {
        if let user = realmController.getLogInUser(){
            let newShoppingList = ShoppingList(user: User(realmUser: user) , shoppingItemArray: shoppingItems)
            realmController.addShoppingList(with: newShoppingList)
            performSegue(withIdentifier: "addedListSegue", sender: self)
        }
    }
    
    @IBAction func unwindToNewShoppingListTable(for unwindSegue: UIStoryboardSegue) {
        let newItemVC = unwindSegue.source as! ShoppingItemTableViewController
        guard let name = newItemVC.nameLabel.text, let countString = newItemVC.countLabel.text, let count = Int(countString) else { return }
        guard !name.isEmpty, count > 0 else { return }
        self.shoppingItems.append(ShoppingItem(name: name, count: count))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
