//
//  InputFormData.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveSwift

enum InputFormDataPeriod {

	case daily
	case weekly
	case monthly

	var title: String {
		switch self {
		case .daily:
			return "Daily"
		case .weekly:
			return "Weekly"
		case .monthly:
			return "Monthly"
		}
	}

}

final class InputFormData {

	let name = MutableProperty("")
	let email = MutableProperty("")
	let sendSpam = MutableProperty(true)
	let zip = MutableProperty("")
	let password = MutableProperty("")
	let period = MutableProperty(InputFormDataPeriod.daily)
	let date = MutableProperty(Date())

}
