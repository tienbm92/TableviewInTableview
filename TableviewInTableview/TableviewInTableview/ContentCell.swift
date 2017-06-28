//
//  ContentCell.swift
//  TableviewInTableview
//
//  Created by Bùi Minh Tiến on 6/27/17.
//  Copyright © 2017 TienBM. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {
    
    @IBOutlet weak var myTableView: UITableView!
    var userName: String = ""
    var phoneNumber: Int = 0
    var countCell: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        self.myTableView.register(UINib.init(nibName: kInfoCell, bundle: nil), forCellReuseIdentifier: kInfoCell)
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }
    
}

extension ContentCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.myTableView.dequeueReusableCell(withIdentifier: kInfoCell, for: indexPath) as? InfoCell else {
            return UITableViewCell()
        }
        cell.userName.text = self.userName
        cell.phoneNumber.text = "\(self.phoneNumber)"
        return cell
    }
    
}

extension ContentCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
