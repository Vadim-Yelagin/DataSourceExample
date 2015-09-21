//
//  ExampleItem.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveCocoa

final class ExampleItem {

	let title: String
	let on = MutableProperty(false)

	init(_ title: String) {
		self.title = title
	}

}
