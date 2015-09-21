//
//  ExampleViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 15/06/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

private func space() -> UIBarButtonItem {
	return UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
}

class ExampleViewController: UIViewController, UITableViewDelegate, UICollectionViewDelegateFlowLayout {

	@IBOutlet var tableView: UITableView?
	@IBOutlet var collectionView: UICollectionView?

	let tableDataSource = TableViewDataSourceWithHeaderFooterTitles()
	let collectionDataSource = CollectionViewDataSource()

	var viewModel: ExampleViewModel? {
		didSet {
			if let viewModel = self.viewModel {
				self.navigationItem.title = viewModel.title
				self.tableDataSource.dataSource.innerDataSource.value = viewModel.dataSource
				self.collectionDataSource.dataSource.innerDataSource.value = viewModel.dataSource
				self.toolbarItems = viewModel.actions.flatMap {
					[space(), $0.barButtonItem()]
					} + [space()]
			}
		}
	}

	@IBAction func toggleView() {
		if let tableView = self.tableView,
			collectionView = self.collectionView
		{
			UIView.animateWithDuration(0.35) {
				tableView.alpha = 1 - tableView.alpha
				collectionView.alpha = 1 - collectionView.alpha
			}
		}
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
		if let collectionView = self.collectionView {
			collectionView.dataSource = self.collectionDataSource
			self.collectionDataSource.collectionView = collectionView
		}
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		if let tableView = self.tableView,
			collectionView = self.collectionView
		{
			collectionView.scrollIndicatorInsets = tableView.scrollIndicatorInsets
			collectionView.contentInset = tableView.contentInset
		}
	}

	func selectItemAtIndexPath(indexPath: NSIndexPath) {
		if let item = self.viewModel?.dataSource.itemAtIndexPath(indexPath) as? ExampleItem {
			item.on.value = !item.on.value
		}
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.selectItemAtIndexPath(indexPath)
	}

	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		self.selectItemAtIndexPath(indexPath)
	}

	func collectionView(collectionView: UICollectionView,
		layout collectionViewLayout: UICollectionViewLayout,
		referenceSizeForHeaderInSection section: Int)
		-> CGSize
	{
		if let viewModel = self.viewModel,
			let _ = viewModel.dataSource.supplementaryItemOfKind(
				UICollectionElementKindSectionHeader,
				inSection: section)
		{
			return CGSizeMake(44, 44)
		} else {
			return CGSizeZero
		}
	}
	
}
