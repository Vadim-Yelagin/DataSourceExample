//
//  InputFormAccessoryItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveSwift

struct InputFormAccessoryItem: InputFormItem {

	var reuseIdentifier: String {
		return "InputFormAccessory"
	}

	let title: String
	let property: MutableProperty<String>
	let expanded = MutableProperty(false)

	init(title: String, property: MutableProperty<String>) {
		self.title = title
		self.property = property
	}

	func select() {
		self.expanded.value = !self.expanded.value
	}

}
