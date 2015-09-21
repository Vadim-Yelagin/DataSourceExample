//
//  StaticSectionsViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import UIKit

final class StaticSectionsViewModel: ExampleViewModel {

	let title = "Static (sections)"

	let dataSource: DataSource = StaticDataSource(sections: [
		DataSourceSection(
			items: StaticData.randomItems(),
			supplementaryItems: [
				UICollectionElementKindSectionHeader: "Section one"
			]),
		DataSourceSection(
			items: StaticData.randomItems(),
			supplementaryItems: [
				UICollectionElementKindSectionHeader: "Section two"
			]),
		DataSourceSection(
			items: StaticData.randomItems(),
			supplementaryItems: [
				UICollectionElementKindSectionHeader: "Section three"
			])
		])

	var actions: [ExampleViewModelAction] {
		return []
	}

}
