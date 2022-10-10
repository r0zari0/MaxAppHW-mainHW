//
//  Cell.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/24/22.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func config(with title: MyUser) {
        nameLabel.text = title.name
        lastNameLabel.text = title.lastName
    }
    
    func setupCell() {
        selectionStyle = .none
    }
}
