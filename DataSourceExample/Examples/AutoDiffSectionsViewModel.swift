//
//  AutoDiffSectionsViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 14/08/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import ReactiveCocoa
import UIKit

final class AutoDiffSectionsViewModel: ExampleViewModel {

	let title = "Auto Diff Sections"

	var dataSource: DataSource {
		return autoDiffDataSource
	}

	lazy var actions: [ExampleViewModelAction] = {
		return [ExampleViewModelAction(title: "Random") {
			[weak self] in self?.random()
		}]
	}()

	let autoDiffDataSource = AutoDiffSectionsDataSource(
		sections: randomSections(),
		findItemMoves: true,
		compareSections: {
			let header0 = $0.supplementaryItems[UICollectionView.elementKindSectionHeader] as! String
			let header1 = $1.supplementaryItems[UICollectionView.elementKindSectionHeader] as! String
			return header0 == header1
		},
		compareItems: { $0 === $1 })

	func random() {
		self.autoDiffDataSource.sections.value = randomSections()
	}

}

private func randomSections() -> [DataSourceSection<ExampleItem>] {
	var sections: [DataSourceSection<ExampleItem>] = []
	for i in 0 ..< 10 {
		if arc4random_uniform(2) == 0 {
			continue
		}
		let header = "Section \(RandomData.spell(i))"
		let items = StaticData.randomItems()
		sections.append(DataSourceSection(items: items, supplementaryItems: [UICollectionView.elementKindSectionHeader: header]))
	}
	return sections
}
