//
//  InputFormViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveSwift
import ReactiveCocoa

class InputFormViewController: UIViewController, UITableViewDelegate {

	@IBOutlet var tableView: UITableView?

	let data = InputFormData()
	let tableDataSource = TableViewDataSource()

	let disposable = CompositeDisposable()

	deinit {
		disposable.dispose()
	}

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
		name.autocapitalizationType = .words
		var email = InputFormTextItem(title: "Email Address", property: data.email)
		email.keyboardType = .emailAddress
		let sendSpam = InputFormBoolItem(title: "I Want to Receive SPAM", property: data.sendSpam)
		let items1: [InputFormItem] = [name, email, sendSpam]
		let static1 = StaticDataSource(items: items1)

		let daily = InputFormOptionItem(title: "• Daily", property: data.period, value: .daily)
		let weekly = InputFormOptionItem(title: "• Weekly", property: data.period, value: .weekly)
		let monthly = InputFormOptionItem(title: "• Monthly", property: data.period, value: .monthly)
		let items2: [InputFormItem] = [daily, weekly, monthly]
		let static2 = StaticDataSource(items: items2)
		let empty2 = EmptyDataSource()
		let proxy2 = ProxyDataSource(empty2)
		disposable += proxy2.innerDataSource <~ data.sendSpam.producer.map {
			(sendSpam: Bool) -> DataSource in
			return sendSpam ? static2 : empty2
		}

		var zip = InputFormTextItem(title: "ZIP Code", property: data.zip)
		zip.keyboardType = .numberPad
		let formattedDate = MutableProperty("")
		disposable += formattedDate <~ data.date.producer.map {
			DateFormatter.localizedString(from: $0, dateStyle: .short, timeStyle: .short)
		}
		let dateAccessory = InputFormAccessoryItem(title: "Date", property: formattedDate)
		let date = InputFormDateItem(title: "Date", property: data.date)
		disposable += date.expanded <~ dateAccessory.expanded
		self.reactive.target { this, _ in this.updateRowHeights() } <~ date.expanded.producer

		var password = InputFormTextItem(title: "Password", property: data.password)
		password.secureTextEntry = true
		let items3: [InputFormItem] = [zip, dateAccessory, date, password]
		let static3 = StaticDataSource(items: items3)

		self.tableDataSource.dataSource.innerDataSource.value = CompositeDataSource([static1, proxy2, static3])
	}

	func updateRowHeights() {
		self.tableView?.beginUpdates()
		self.tableView?.endUpdates()
	}

	@IBAction func showData() {
		let date = DateFormatter.localizedString(from: data.date.value, dateStyle: .short, timeStyle: .short)
		let message = "Full Name: \(data.name.value)\nEmail Address: \(data.email.value)\nSend SPAM: \(data.sendSpam.value)\nPeriod: \(data.period.value.title)\nZIP Code: \(data.zip.value)\nDate: \(date)\nPassword: \(data.password.value)"
		let alert = UIAlertController(title: "Data", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		if let tableView = self.tableView {
			tableView.estimatedRowHeight = 44
			tableView.rowHeight = UITableView.automaticDimension
			tableView.sectionHeaderHeight = UITableView.automaticDimension
			tableView.dataSource = self.tableDataSource
			self.tableDataSource.tableView = tableView
		}
	}

	func tableView(_ tableView: UITableView,
		didSelectRowAt indexPath: IndexPath)
	{
		tableView.deselectAllRows(true)
		if let item = self.tableDataSource.dataSource.item(at: indexPath) as? InputFormItem {
			item.select()
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if let item = self.tableDataSource.dataSource.item(at: indexPath) as? InputFormDateItem, !item.expanded.value {
			return 0
		}
		return UITableView.automaticDimension
	}

}
