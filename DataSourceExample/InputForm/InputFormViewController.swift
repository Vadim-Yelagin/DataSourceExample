//
//  InputFormViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class InputFormViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView?
    
    let data = InputFormData()
    let tableDataSource = TableViewDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tableDataSource.reuseIdentifierForItem = {
            _, item in
            if let item = item as? InputFormItem {
                return item.reuseIdentifier
            } else {
                return "DefaultCell"
            }
        }
        let name = InputFormTextItem(placeholder: "Name", property: data.name)
        self.tableDataSource.dataSource.innerDataSource.value = StaticDataSource(items: [name])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tableView = self.tableView {
            tableView.estimatedRowHeight = 44
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.sectionHeaderHeight = UITableViewAutomaticDimension
            tableView.dataSource = self.tableDataSource
            self.tableDataSource.tableView = tableView
        }
    }

}
