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

func random(_ x: Int) -> Int {
	return Int(arc4random_uniform(UInt32(x)))
}

struct RandomData {

	static func spell(_ number: Int) -> String {
		let nf = NumberFormatter()
		nf.numberStyle = .spellOut
		nf.formattingContext = .standalone
		return nf.string(from: NSNumber(value: number as Int))!
	}

	static func title(_ value: Int = 1000) -> String {
		return self.spell(random(value))
	}

	static func items(_ count: Int = 5, value: Int = 1000) -> [ExampleItem] {
		let n = 1 + random(count)
		return (0 ..< n).map { _ in
			ExampleItem(self.title(value))
		}
	}

	static func section() -> DataSourceSection<ExampleItem> {
		let title = self.title()
		return DataSourceSection(items: self.items(),
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
