//
//  EditingTableViewDataSource.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class EditingTableViewDataSource: TableViewDataSource {

	let mutableDataSource = MutableDataSource(StaticData.items)

	override init() {
		super.init()
		self.dataSource.innerDataSource.value = self.mutableDataSource
	}

	func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView,
		commitEditingStyle editingStyle: UITableViewCellEditingStyle,
		forRowAtIndexPath indexPath: IndexPath)
	{
		self.mutableDataSource.deleteItem(at: indexPath.row)
	}

	func tableView(_ tableView: UITableView, canMoveRowAtIndexPath indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView,
		moveRowAtIndexPath sourceIndexPath: IndexPath,
		toIndexPath destinationIndexPath: IndexPath)
	{
		self.mutableDataSource.moveItem(at: sourceIndexPath.row, to: destinationIndexPath.row)
	}

}
