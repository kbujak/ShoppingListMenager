//
//  ShoppingListTableViewCell.swift
//  ShoppingListMenager
//
//  Created by Krystian Bujak on 16/10/2017.
//  Copyright © 2017 Krystian Bujak. All rights reserved.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with shoppingList: ShoppingList){
        self.dateLabel.text = DateHelper.getStringFromDate(with: .medium, date: shoppingList.date)
        self.authorLabel.text = "Author: \(shoppingList.author.login)"
        self.ownerLabel.text = "Owner: " + (shoppingList.owner != nil ? (shoppingList.owner?.login)! : "none")
        self.stateLabel.text = shoppingList.state.rawValue
    }

}
