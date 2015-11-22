//
//  InputFormAccessoryCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class InputFormAccessoryCell: TableViewCell, Disposing {

	@IBOutlet var titleLabel: UILabel?
	@IBOutlet var valueLabel: UILabel?

	let disposable = CompositeDisposable()

	deinit {
		disposable.dispose()
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		let items = self.item.producer
			.map { $0 as? InputFormAccessoryItem }
			.ignoreNil()
		items.start(self, InputFormAccessoryCell.configureWithItem)
		items.flatMap(.Latest) { $0.property.producer }
			.start(self, InputFormAccessoryCell.configureWithValue)
		items.flatMap(.Latest) { $0.expanded.producer }
			.start(self, InputFormAccessoryCell.configureWithExpanded)
	}

	func configureWithItem(item: InputFormAccessoryItem) {
		self.titleLabel?.text = item.title
	}

	func configureWithValue(value: String) {
		self.valueLabel?.text = value
	}

	func configureWithExpanded(expanded: Bool) {
		self.valueLabel?.textColor = expanded ? UIColor(red: 0.75, green: 0, blue: 0, alpha: 1) : UIColor.blackColor()
	}

}
