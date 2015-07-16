//
//  RandomData.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import UIKit

func random(x: Int) -> Int {
    return Int(arc4random_uniform(UInt32(x)))
}

struct RandomData {

    static func spell(number: Int) -> String {
        let nf = NSNumberFormatter()
        nf.numberStyle = .SpellOutStyle
        nf.formattingContext = .Standalone
        return nf.stringFromNumber(NSNumber(integer: number))!
    }
    
    static func title(value: Int = 1000) -> String {
        return self.spell(random(value))
    }
    
    static func items(count: Int = 5, value: Int = 1000) -> [ExampleItem] {
        let n = 1 + random(count)
        return (0 ..< n).map { _ in
            ExampleItem(self.title(value: value))
        }
    }

    static func section() -> StaticDataSourceSection<ExampleItem> {
        let title = self.title()
        return StaticDataSourceSection(items: self.items(),
            supplementaryItems: [UICollectionElementKindSectionHeader: title])
    }

    static func dataSource() -> StaticDataSource<ExampleItem> {
        let n = 1 + random(5)
        let sections = (0 ..< n).map { _ in
            self.section()
        }
        return StaticDataSource(sections: sections)
    }

}
