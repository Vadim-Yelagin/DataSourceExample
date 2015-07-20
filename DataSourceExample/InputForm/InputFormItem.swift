//
//  InputFormItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation

protocol InputFormItem {
    
    var reuseIdentifier: String { get }
    var title: String { get }
    
}
