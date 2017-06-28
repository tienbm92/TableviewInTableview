//
//  TableViewController.swift
//  TableviewInTableview
//
//  Created by Bùi Minh Tiến on 6/26/17.
//  Copyright © 2017 TienBM. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var userName: String = ""
    var phoneNumber: Int = 0
    var isNumber: Bool = false
    var countCell: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        registerForCell()
    }

    private func registerForCell() {
        self.tableView.register(UINib(nibName: kContentCell, bundle: nil), forCellReuseIdentifier: kContentCell)
        self.tableView.register(UINib(nibName: kInputContentCell, bundle: nil), forCellReuseIdentifier: kInputContentCell)
        self.tableView.register(UINib(nibName: kButtonCell, bundle: nil), forCellReuseIdentifier: kButtonCell)
    }
    
    private func cellForContent(in tableview: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kContentCell, for: indexPath) as? ContentCell else {
            return UITableViewCell()
        }
        cell.userName = self.userName
        cell.phoneNumber = self.phoneNumber
        cell.countCell = self.countCell
        cell.myTableView.reloadData()
        return cell
    }
    
    private func cellForInputContent(in tableview: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kInputContentCell, for: indexPath) as? InputContentCell else {
            return UITableViewCell()
        }
        cell.isNumber = self.isNumber
        isNumber ? (cell.myImage.image = #imageLiteral(resourceName: "ic_phone")) : (cell.myImage.image = #imageLiteral(resourceName: "ic_user"))
        cell.completion = { (text, isNumber) in
            isNumber ? (self.phoneNumber = Int(text) ?? 0) : (self.userName = text)
        }
        return cell
    }
    
    private func cellForButton(in tableview: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kButtonCell, for: indexPath) as? ButtonCell else {
            return UITableViewCell()
        }
        cell.completion = { (countCell) in
            self.countCell = countCell
            self.tableView.reloadData()
        }
        return cell
    }
    
    private func handleReturnCell(in tableview: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            self.isNumber = false
            return self.cellForInputContent(in: tableview, at: indexPath)
        case 1:
            self.isNumber = true
            return self.cellForInputContent(in: tableview, at: indexPath)
        case 2:
            return self.cellForButton(in: tableview, at: indexPath)
        case 3:
            return self.cellForContent(in:tableview, at: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.handleReturnCell(in: tableView, at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 300
        }
        return 50
    }

}
