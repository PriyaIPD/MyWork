//
//  PetitionTVC.swift
//  APIImplementation
//
//  Created by Priya Gandhi on 2023-11-22.
//

import UIKit

class PetitionTVC: UITableViewCell {
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblBody : UILabel!
    @IBOutlet weak var lblStatus : UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
