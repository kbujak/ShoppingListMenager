//
//  TakeRemoveListTableViewController.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 20/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit

class TakeRemoveListTableViewController: UITableViewController {

    @IBOutlet weak var takeListButton: UIBarButtonItem!
    @IBOutlet weak var removeListButton: UIBarButtonItem!
    
    var list: RealmShoppingList!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func takeListAct(_ sender: Any) {
        delegate.realmController.assignOwnerToList(with: list)
        performSegue(withIdentifier: "backToShoppingListSegue", sender: self)
    }
    
    @IBAction func removeListAct(_ sender: Any) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.shoppingItemList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! NewShoppingListTableViewCell
        let item = Array(list.shoppingItemList)[indexPath.row]
        cell.nameLabel.text = item.name
        cell.countLabel.text = String(describing: item.count)
        return cell
    }
}
