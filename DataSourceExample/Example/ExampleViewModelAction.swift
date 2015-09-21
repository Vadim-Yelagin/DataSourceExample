//
//  ExampleViewModelAction.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import UIKit

@objc class ExampleViewModelAction: NSObject {

	let title: String
	let perform: Void -> Void

	init(title: String, perform: Void -> Void) {
		self.title = title
		self.perform = perform
	}

	func barButtonItem() -> UIBarButtonItem {
		return UIBarButtonItem(title: self.title, style: .Plain, target: self, action: "doPerform")
	}

	@objc func doPerform() {
		self.perform()
	}

}
