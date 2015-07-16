//
//  StaticData.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 17/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation

struct StaticData {
    
    static let items = (0 ..< 7).map { ExampleItem(RandomData.spell(126 + 113 * $0)) }
    
    static func randomItem() -> ExampleItem {
        return items[random(items.count)]
    }
    
    static func randomItems() -> [ExampleItem] {
        let n = 3 + random(7)
        return (0 ..< n).map { _ in self.randomItem() }
    }
    
}
