//
//  MasterViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 15/06/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class MasterViewController: UIViewController {

    @IBOutlet var tableView: UITableView?
    @IBOutlet var dataSource: TableViewDataSource?

    override func awakeFromNib() {
        super.awakeFromNib()
        let one = CatalogItem(title: "one")
        let two = CatalogItem(title: "two")
        self.dataSource?.dataSource.innerDataSource.value = StaticDataSource(items: [one, two])
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView?.deselectAllRows(animated)
    }
    
}
