//
//  EditingViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class EditingViewController: UIViewController, UITableViewDelegate {

	@IBOutlet var tableView: UITableView?

	let tableDataSource = EditingTableViewDataSource()

	override func viewDidLoad() {
		super.viewDidLoad()
		if let tableView = self.tableView {
			tableView.estimatedRowHeight = 44
			tableView.rowHeight = UITableView.automaticDimension
			tableView.sectionHeaderHeight = UITableView.automaticDimension
			tableView.dataSource = self.tableDataSource
			self.tableDataSource.tableView = tableView
			tableView.isEditing = true
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tableView?.beginUpdates()
		self.tableView?.endUpdates()
	}

	@IBAction func add() {
		self.tableDataSource.mutableDataSource.insertItem(StaticData.randomItem(), at: 0)
	}

}
