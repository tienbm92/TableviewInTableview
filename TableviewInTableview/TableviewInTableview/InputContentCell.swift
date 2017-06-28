//
//  InputContentCell.swift
//  TableviewInTableview
//
//  Created by Bùi Minh Tiến on 6/27/17.
//  Copyright © 2017 TienBM. All rights reserved.
//

import UIKit

class InputContentCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myTextField: UITextField!
    var isNumber: Bool = false {
        didSet {
            isNumber ? (self.myTextField.keyboardType = .numberPad) : (self.myTextField.keyboardType = .default)
        }
    }
    var completion: ((_ text: String, _ isNumber: Bool)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myTextField.delegate = self
    }

    fileprivate func inputText() -> Bool {
        if let textInput = self.myTextField.text, let completion = self.completion {
            completion(textInput, isNumber)
            return true
        } else {
            return false
        }
    }
    
}

extension InputContentCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.inputText()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return self.inputText()
    }
    
}
