//
//  InputFormAccessoryCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveSwift
import ReactiveCocoa

class InputFormAccessoryCell: TableViewCell {

	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var valueLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		
		let items = self.cellModel.producer
			.map { $0 as? InputFormAccessoryItem }
			.skipNil()

		self.titleLabel.reactive.text <~ items
			.map { $0.title }

		self.valueLabel.reactive.text <~ items
			.flatMapLatest { $0.property.producer }

		self.valueLabel.reactive.textColor <~ items
			.flatMapLatest { $0.expanded.producer }
			.map { $0 ? UIColor(red: 0.75, green: 0, blue: 0, alpha: 1) : UIColor.black }
	}

}
