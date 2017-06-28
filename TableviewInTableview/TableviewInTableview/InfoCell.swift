//
//  InfoCell.swift
//  TableviewInTableview
//
//  Created by Bùi Minh Tiến on 6/27/17.
//  Copyright © 2017 TienBM. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
