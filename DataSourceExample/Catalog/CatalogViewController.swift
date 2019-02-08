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

	let tableDataSource = TableViewDataSource()

	override func awakeFromNib() {
		super.awakeFromNib()
		let items: [Any] = [
			CatalogItem(title: "Static (items)") { StaticItemsViewModel() },
			CatalogItem(title: "Static (sections)") { StaticSectionsViewModel() },
			CatalogItem(title: "Proxy") { ProxyViewModel() },
			CatalogItem(title: "Auto Diff") { AutoDiffViewModel() },
			CatalogItem(title: "Auto Diff Sections") { AutoDiffSectionsViewModel() },
			CatalogItem(title: "Composite") { CompositeViewModel() },
			CatalogItem(title: "Mutable") { MutableViewModel() },
			CatalogStaticItem(reuseIdentifier: "Editing"),
			CatalogStaticItem(reuseIdentifier: "InputForm")
		]
		self.tableDataSource.dataSource.innerDataSource.value = StaticDataSource(items: items)
		self.tableDataSource.reuseIdentifierForItem = {
			_, item in
			if let item = item as? CatalogStaticItem {
				return item.reuseIdentifier
			} else {
				return "DefaultCell"
			}
		}
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

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tableView?.deselectAllRows(animated)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let nc = segue.destination as? UINavigationController,
			let vc = nc.topViewController as? ExampleViewController,
			let cell = sender as? CatalogCell,
			let cellModel = cell.cellModel.value as? CatalogItem,
			segue.identifier == "ShowExampleSegue"
		{
			vc.viewModel = cellModel.viewModel()
		}
	}

}
