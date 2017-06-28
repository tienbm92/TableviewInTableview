//
//  ButtonCell.swift
//  TableviewInTableview
//
//  Created by Bùi Minh Tiến on 6/28/17.
//  Copyright © 2017 TienBM. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {
    
    var completion: ((_ count: Int)->Void)?
    fileprivate var countCell = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionAddCell(_ sender: UIButton) {
        if let completion = completion {
            self.countCell += 1
            completion(self.countCell)
        }
    }
    
}
