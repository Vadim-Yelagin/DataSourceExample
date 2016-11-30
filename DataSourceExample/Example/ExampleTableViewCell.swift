//
//  ExampleTableViewCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveSwift
import ReactiveCocoa

class ExampleTableViewCell: TableViewCell {

	@IBOutlet var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? ExampleItem }
			.skipNil()

		self.titleLabel.reactive.text <~ items
			.map { $0.title }

		self.reactive.accessoryType <~ items
			.flatMap(.latest) { $0.on.producer }
			.map { $0 ? .checkmark : .none }
	}

}
