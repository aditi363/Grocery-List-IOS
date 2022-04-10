//
//  GroceryItemTableViewCell.swift
//  GroceryList
//
//  Created by ADITI SAINI on 2022-04-09.
//

import UIKit

class GroceryItemTableViewCell: UITableViewCell {

    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var groceyItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
