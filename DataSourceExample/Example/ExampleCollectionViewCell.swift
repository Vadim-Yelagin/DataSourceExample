//
//  ExampleCollectionViewCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveSwift
import ReactiveCocoa

class ExampleCollectionViewCell: CollectionViewCell {

	@IBOutlet var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? ExampleItem }
			.skipNil()

		self.titleLabel.reactive.text <~ items
			.map { $0.title }

		self.titleLabel.reactive.textColor <~ items
			.flatMapLatest { $0.on.producer }
			.map { $0 ? UIColor(red: 0.75, green: 0, blue: 0, alpha: 1) : UIColor.black }
	}

	func updateBackground() {
		self.backgroundColor = (self.isHighlighted || self.isSelected)
			? .lightGray : .groupTableViewBackground
	}

	override var isSelected: Bool {
		didSet {
			self.updateBackground()
		}
	}

	override var isHighlighted: Bool {
		didSet {
			self.updateBackground()
		}
	}

}
