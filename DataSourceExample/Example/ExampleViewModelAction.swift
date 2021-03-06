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
    let perform: () -> Void

    init(title: String, perform: @escaping () -> Void) {
		self.title = title
		self.perform = perform
	}

	func barButtonItem() -> UIBarButtonItem {
		return UIBarButtonItem(title: self.title, style: .plain, target: self, action: #selector(ExampleViewModelAction.doPerform))
	}

	@objc func doPerform() {
		self.perform()
	}

}
