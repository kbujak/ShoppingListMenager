//
//  ShoppingListTableViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {

    var shoppingListArray = Array<RealmShoppingList>()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl?.addTarget(self, action: #selector(reloadShoppingList), for: .valueChanged)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingListArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ShoppingListTableViewCell
        cell.update(with: shoppingListArray[indexPath.row])
        return cell
    }
 
    @IBAction func unwindToShoppingList(for unwindSegue: UIStoryboardSegue) {}
    
    override func viewWillAppear(_ animated: Bool) {
        reloadShoppingList()
    }
    
    @objc func reloadShoppingList(){
        if let realmShoppingLists = delegate.realmController.getShoppingList(){
            shoppingListArray.removeAll()
            for realmShoppingList in realmShoppingLists{
                shoppingListArray.append(realmShoppingList)
            }
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedListSegue"{
            let indexPath = tableView.indexPathForSelectedRow!
            let list = shoppingListArray[indexPath.row]
            let vc = segue.destination as! TakeRemoveListTableViewController
            vc.removeListButton.isEnabled = false
            if ShoppingListStates.init(intValue: list.state) == ShoppingListStates.taken{ vc.takeListButton.isEnabled = false }
            vc.list = list
        }
    }
    
    
}
