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
            |> map { $0 as? InputFormTextItem }
            |> ignoreNil
        items |> start(self, InputFormTextFieldCell.configureWithItem)
        items |> flatMap(.Latest) { $0.property.producer }
            |> start(self, InputFormTextFieldCell.configureWithValue)
        self.textField?.addTarget(self, action: "onEditing:", forControlEvents: .AllEditingEvents)
    }
    
    func configureWithItem(item: InputFormTextItem) {
        self.textField?.placeholder = item.placeholder
    }
    
    func configureWithValue(value: String) {
        self.textField?.text = value
    }
    
    func onEditing(textField: UITextField) {
        if let item = self.item.value as? InputFormTextItem {
            item.property.value = textField.text
        }
    }

}
