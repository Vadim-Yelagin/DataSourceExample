//
//  InputFormViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class InputFormViewController: UIViewController, UITableViewDelegate {
    
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
        var name = InputFormTextItem(title: "Full Name", property: data.name)
        name.autocapitalizationType = .Words
        var email = InputFormTextItem(title: "Email Address", property: data.email)
        email.keyboardType = .EmailAddress
        var sendSpam = InputFormBoolItem(title: "I Want to Receive SPAM", property: data.sendSpam)
        
        let daily = InputFormOptionItem(title: "Daily", property: data.period, value: .Daily)
        let weekly = InputFormOptionItem(title: "Weekly", property: data.period, value: .Weekly)
        let monthly = InputFormOptionItem(title: "Monthly", property: data.period, value: .Monthly)
        
        var zip = InputFormTextItem(title: "ZIP Code", property: data.zip)
        zip.keyboardType = .NumberPad
        var password = InputFormTextItem(title: "Password", property: data.password)
        password.secureTextEntry = true
        let items: [InputFormItem] = [name, email, sendSpam, daily, weekly, monthly, zip, password]
        self.tableDataSource.dataSource.innerDataSource.value = StaticDataSource(items: items)
    }
    
    @IBAction func showData() {
        let message = "Full Name: \(data.name.value)\nEmail Address: \(data.email.value)\nSend SPAM: \(data.sendSpam.value)\nZIP Code: \(data.zip.value)\nPassword: \(data.password.value)"
        let alert = UIAlertController(title: "Data", message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
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
    
    func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectAllRows(true)
        if let item = self.tableDataSource.dataSource.itemAtIndexPath(indexPath) as? InputFormItem {
            item.select()
        }
    }

}
