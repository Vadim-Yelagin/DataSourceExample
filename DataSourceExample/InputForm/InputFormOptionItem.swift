//
//  InputFormOptionItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 20/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveCocoa

protocol InputFormOptionItemProtocol: InputFormItem {

	var current: SignalProducer<Bool, NoError> { get }

}

struct InputFormOptionItem<T: Equatable>: InputFormOptionItemProtocol {

	var reuseIdentifier: String {
		return "InputFormOption"
	}

	let title: String
	let property: MutableProperty<T>
	let value: T
	let current: SignalProducer<Bool, NoError>

	init(title: String, property: MutableProperty<T>, value: T) {
		self.title = title
		self.property = property
		self.value = value
		self.current = property.producer.map { $0 == value }
	}

	func select() {
		self.property.value = self.value
	}

}
