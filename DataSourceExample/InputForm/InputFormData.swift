//
//  InputFormData.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveCocoa

enum InputFormDataPeriod {
    
    case Daily
    case Weekly
    case Monthly
    
    var title: String {
        switch self {
        case .Daily:
            return "Daily"
        case .Weekly:
            return "Weekly"
        case .Monthly:
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
    let period = MutableProperty(InputFormDataPeriod.Daily)
    let date = MutableProperty(NSDate())
    
}
