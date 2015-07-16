//
//  ExampleViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource

protocol ExampleViewModel {

    var title: String { get }
    var dataSource: DataSource { get }
    var actions: [ExampleViewModelAction] { get }
    
}
