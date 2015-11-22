//
//  CatalogCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class CatalogCell: TableViewCell {

	@IBOutlet var titleLabel: UILabel?

	let disposable = CompositeDisposable()

	deinit {
		disposable.dispose()
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		disposable += self.item.producer
			.map { $0 as? CatalogItem }
			.ignoreNil()
			.start(self, CatalogCell.configureWithItem)
	}

	func configureWithItem(item: CatalogItem) {
		self.titleLabel?.text = item.title
	}

}
