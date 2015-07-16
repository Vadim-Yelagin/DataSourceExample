//
//  CatalogItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation

struct CatalogItem {
    
    let title: String
    let viewModel: () -> ExampleViewModel
    
    init(title: String, viewModel:() -> ExampleViewModel) {
        self.title = title
        self.viewModel = viewModel
    }
    
}
