//
//  CatalogViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 15/06/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class CatalogViewController: UIViewController {

    @IBOutlet var tableView: UITableView?
    
    let dataSource = TableViewDataSource()

    override func awakeFromNib() {
        super.awakeFromNib()
        let one = CatalogItem(title: "one")
        let two = CatalogItem(title: "two")
        self.dataSource.dataSource.innerDataSource.value = StaticDataSource(items: [one, two])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.tableView = self.tableView
        self.tableView?.dataSource = self.dataSource
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView?.deselectAllRows(animated)
    }
    
}
