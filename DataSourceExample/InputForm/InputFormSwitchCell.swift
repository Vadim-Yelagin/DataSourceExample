//
//  InputFormSwitchCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class InputFormSwitchCell: TableViewCell {

	@IBOutlet var titleLabel: UILabel?
	@IBOutlet var switchControl: UISwitch?

	override func awakeFromNib() {
		super.awakeFromNib()
		let items = self.cellModel.producer
			.map { $0 as? InputFormBoolItem }
			.ignoreNil()
		items.start(self, InputFormSwitchCell.configureWithItem)
		items.flatMap(.Latest) { $0.property.producer }
			.start(self, InputFormSwitchCell.configureWithValue)
	}

	func configureWithItem(item: InputFormBoolItem) {
		self.titleLabel?.text = item.title
	}

	func configureWithValue(value: Bool) {
		self.switchControl?.on = value
	}

	@IBAction func onEditing(switchControl: UISwitch) {
		if let cellModel = self.cellModel.value as? InputFormBoolItem {
			cellModel.property.value = switchControl.on
		}
	}

}
