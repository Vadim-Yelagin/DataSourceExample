//
//  InputFormDatePickerCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class InputFormDatePickerCell: TableViewCell {

	@IBOutlet var datePicker: UIDatePicker?

	let disposable = CompositeDisposable()

	deinit {
		disposable.dispose()
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		let items = self.item.producer
			.map { $0 as? InputFormDateItem }
			.ignoreNil()
		disposable += items.flatMap(.Latest) { $0.property.producer }
			.start(self, InputFormDatePickerCell.configureWithValue)
	}

	func configureWithValue(value: NSDate) {
		self.datePicker?.date = value
	}

	@IBAction func onEditing(datePicker: UIDatePicker) {
		if let item = self.item.value as? InputFormDateItem {
			item.property.value = datePicker.date
		}
	}

}
