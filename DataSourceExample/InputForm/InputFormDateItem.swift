//
//  InputFormDateItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveCocoa

struct InputFormDateItem: InputFormItem {
    
    var reuseIdentifier: String {
        return "InputFormDate"
    }
    
    let title: String
    let property: MutableProperty<NSDate>
    let expanded = MutableProperty(false)
    
    init(title: String, property: MutableProperty<NSDate>) {
        self.title = title
        self.property = property
    }
    
    func select() {}
    
}
