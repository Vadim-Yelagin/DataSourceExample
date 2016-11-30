//
//  InputFormTextFieldCell.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveSwift
import ReactiveCocoa

class InputFormTextFieldCell: TableViewCell {

	@IBOutlet var textField: UITextField!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.cellModel.producer
			.map { $0 as? InputFormTextItem }
			.skipNil()

		self.reactive.target { $0.configure(item: $1) } <~ items

		self.textField.reactive.text <~ items
			.flatMapLatest { $0.property.producer }
	}

	func configure(item: InputFormTextItem) {
		self.textField?.placeholder = item.title
		self.textField?.autocapitalizationType = item.autocapitalizationType
		self.textField?.autocorrectionType = item.autocorrectionType
		self.textField?.keyboardType = item.keyboardType
		self.textField?.isSecureTextEntry = item.secureTextEntry
	}

	@IBAction func onEditing(_ textField: UITextField) {
		if let item = self.cellModel.value as? InputFormTextItem {
			item.property.value = textField.text ?? ""
		}
	}

}
