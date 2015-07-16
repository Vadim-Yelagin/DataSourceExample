//
//  StaticItemsViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource

final class StaticItemsViewModel: ExampleViewModel {
    
    let title = "Static (items)"
    
    let dataSource: DataSource = StaticDataSource(items: [
        ExampleItem("One"),
        ExampleItem("Two"),
        ExampleItem("Three")
    ])
    
}
