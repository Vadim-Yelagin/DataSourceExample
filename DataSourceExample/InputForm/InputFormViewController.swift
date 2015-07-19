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
        var name = InputFormTextItem(placeholder: "Full Name", property: data.name)
        name.autocapitalizationType = .Words
        var email = InputFormTextItem(placeholder: "Email Address", property: data.email)
        email.keyboardType = .EmailAddress
        var zip = InputFormTextItem(placeholder: "ZIP Code", property: data.zip)
        zip.keyboardType = .NumberPad
        var password = InputFormTextItem(placeholder: "Password", property: data.password)
        password.secureTextEntry = true
        self.tableDataSource.dataSource.innerDataSource.value = StaticDataSource(items: [name, email, zip, password])
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
