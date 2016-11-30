//
//  InputFormSwitchCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveSwift
import ReactiveCocoa

class InputFormSwitchCell: TableViewCell {

	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var switchControl: UISwitch!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? InputFormBoolItem }
			.skipNil()

		self.titleLabel.reactive.text <~ items
			.map { $0.title }

		self.switchControl.reactive.isOn <~ items
			.flatMapLatest { $0.property.producer }
	}

	@IBAction func onEditing(_ switchControl: UISwitch) {
		if let cellModel = self.cellModel.value as? InputFormBoolItem {
			cellModel.property.value = switchControl.isOn
		}
	}

}
