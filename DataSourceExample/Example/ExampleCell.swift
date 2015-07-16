//
//  ExampleCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class ExampleCell: TableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.item.producer.start(next: {
            [weak self] item in
            if let this = self, item = item as? ExampleItem {
                this.textLabel?.text = item.title
            }
        })
    }

}
