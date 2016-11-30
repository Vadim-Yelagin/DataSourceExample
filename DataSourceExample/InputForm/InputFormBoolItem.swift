//
//  InputFormBoolItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveSwift

struct InputFormBoolItem: InputFormItem {

	var reuseIdentifier: String {
		return "InputFormBool"
	}

	let title: String
	let property: MutableProperty<Bool>

	init(title: String, property: MutableProperty<Bool>) {
		self.title = title
		self.property = property
	}

	func select() {}

}
