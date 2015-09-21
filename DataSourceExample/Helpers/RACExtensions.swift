//
//  RACExtensions.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveCocoa

extension SignalProducer {

	func start<O: AnyObject>(target: O, _ method: O -> T -> ()) -> Disposable {
		return self.startWithNext {
			[weak target] value in
			if let target = target {
				method(target)(value)
			}
		}
	}

}
