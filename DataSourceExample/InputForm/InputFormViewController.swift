//
//  InputFormViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

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
        let items1: [InputFormItem] = [name, email, sendSpam]
        let static1 = StaticDataSource(items: items1)
        
        let daily = InputFormOptionItem(title: "• Daily", property: data.period, value: .Daily)
        let weekly = InputFormOptionItem(title: "• Weekly", property: data.period, value: .Weekly)
        let monthly = InputFormOptionItem(title: "• Monthly", property: data.period, value: .Monthly)
        let items2: [InputFormItem] = [daily, weekly, monthly]
        let static2 = StaticDataSource(items: items2)
        let empty2 = EmptyDataSource()
        let proxy2 = ProxyDataSource(empty2)
        proxy2.innerDataSource <~ data.sendSpam.producer |> map {
            (sendSpam: Bool) -> DataSource in
            return sendSpam ? static2 : empty2
        }
        
        var zip = InputFormTextItem(title: "ZIP Code", property: data.zip)
        zip.keyboardType = .NumberPad
        let date = InputFormDateItem(title: "Date", property: data.date)
        var password = InputFormTextItem(title: "Password", property: data.password)
        password.secureTextEntry = true
        let items3: [InputFormItem] = [zip, date, password]
        let static3 = StaticDataSource(items: items3)
        
        self.tableDataSource.dataSource.innerDataSource.value = CompositeDataSource([static1, proxy2, static3])
    }
    
    @IBAction func showData() {
        let date = NSDateFormatter.localizedStringFromDate(data.date.value, dateStyle: .ShortStyle, timeStyle: .ShortStyle)
        let message = "Full Name: \(data.name.value)\nEmail Address: \(data.email.value)\nSend SPAM: \(data.sendSpam.value)\nPeriod: \(data.period.value.title)\nZIP Code: \(data.zip.value)\nDate: \(date)\nPassword: \(data.password.value)"
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
