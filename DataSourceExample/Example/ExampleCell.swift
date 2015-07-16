//
//  ExampleCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class ExampleCell: TableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.item.producer
            |> filterMap(cast)
            |> start(self, ExampleCell.configureWithItem)
    }
    
    func configureWithItem(item: ExampleItem) {
        self.textLabel?.text = item.title
    }

}
