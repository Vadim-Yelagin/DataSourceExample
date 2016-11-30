//
//  InputFormDateItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveSwift

struct InputFormDateItem: InputFormItem {

	var reuseIdentifier: String {
		return "InputFormDate"
	}

	let title: String
	let property: MutableProperty<Date>
	let expanded = MutableProperty(false)

	init(title: String, property: MutableProperty<Date>) {
		self.title = title
		self.property = property
	}

	func select() {}

}
