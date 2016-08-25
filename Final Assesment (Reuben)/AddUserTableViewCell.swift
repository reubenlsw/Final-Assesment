//
//  AddUserTableViewCell.swift
//  Final Assesment (Reuben)
//
//  Created by Nicole on 25/08/2016.
//  Copyright © 2016 NextAcademy. All rights reserved.
//

import UIKit

class AddUserTableViewCell: UITableViewCell {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var userName: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    
    @IBAction func onAddButtonPressed(sender: UIButton) {
        sender.setTitle("Added", forState: .Normal)
        
    }

}
