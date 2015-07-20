//
//  InputFormTextItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveCocoa

struct InputFormTextItem: InputFormItem {

    var reuseIdentifier: String {
        return "InputFormText"
    }
    
    let title: String
    let property: MutableProperty<String>
    
    var autocapitalizationType = UITextAutocapitalizationType.None
    var autocorrectionType = UITextAutocorrectionType.No
    var keyboardType = UIKeyboardType.Default
    var secureTextEntry = false
    
    init(title: String, property: MutableProperty<String>) {
        self.title = title
        self.property = property
    }
    
    func select() {}
    
}
