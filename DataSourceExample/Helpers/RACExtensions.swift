//
//  RACExtensions.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import ReactiveCocoa

func start<T: AnyObject, V, E>
    (target: T, method: T -> V -> ())
    (_ producer: SignalProducer<V, E>)
    -> Disposable
{
    return producer.start(next: {
        [weak target] value in
        if let target = target {
            method(target)(value)
        }
    })
}
