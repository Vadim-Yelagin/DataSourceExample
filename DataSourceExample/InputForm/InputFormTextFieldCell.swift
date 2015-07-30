//
//  InputFormTextFieldCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class InputFormTextFieldCell: TableViewCell {
    
    @IBOutlet var textField: UITextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let items = self.item.producer
            .map { $0 as? InputFormTextItem }
            .ignoreNil()
        items.start(self, InputFormTextFieldCell.configureWithItem)
        items.flatMap(.Latest) { $0.property.producer }
            .start(self, InputFormTextFieldCell.configureWithValue)
    }
    
    func configureWithItem(item: InputFormTextItem) {
        self.textField?.placeholder = item.title
        self.textField?.autocapitalizationType = item.autocapitalizationType
        self.textField?.autocorrectionType = item.autocorrectionType
        self.textField?.keyboardType = item.keyboardType
        self.textField?.secureTextEntry = item.secureTextEntry
    }
    
    func configureWithValue(value: String) {
        self.textField?.text = value
    }
    
    @IBAction func onEditing(textField: UITextField) {
        if let item = self.item.value as? InputFormTextItem {
            item.property.value = textField.text ?? ""
        }
    }

}
