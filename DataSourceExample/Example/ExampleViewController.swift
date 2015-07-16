//
//  ExampleViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 15/06/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class ExampleViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView?
    
    let dataSource = TableViewDataSourceWithHeaderFooterTitles()
    
    var viewModel: ExampleViewModel? {
        didSet {
            if let viewModel = self.viewModel {
                self.navigationItem.title = viewModel.title
                self.dataSource.dataSource.innerDataSource.value = viewModel.dataSource
                self.navigationItem.rightBarButtonItems = viewModel.actions.map {
                    $0.barButtonItem()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource.tableView = self.tableView
        self.tableView?.dataSource = self.dataSource
    }

}
