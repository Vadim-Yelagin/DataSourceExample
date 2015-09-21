//
//  InputFormOptionCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class InputFormOptionCell: TableViewCell {

	@IBOutlet var titleLabel: UILabel?

	override func awakeFromNib() {
		super.awakeFromNib()
		let items = self.item.producer
			.map { $0 as? InputFormOptionItemProtocol }
			.ignoreNil()
		items.start(self, InputFormOptionCell.configureWithItem)
		items.flatMap(.Latest) { $0.current }
			.start(self, InputFormOptionCell.configureWithValue)
	}

	func configureWithItem(item: InputFormOptionItemProtocol) {
		self.titleLabel?.text = item.title
	}

	func configureWithValue(value: Bool) {
		self.accessoryType = value ? .Checkmark : .None
	}

}
