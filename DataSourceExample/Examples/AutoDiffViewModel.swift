//
//  AutoDiffViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import ReactiveCocoa

final class AutoDiffViewModel: ExampleViewModel {

	let title = "Auto Diff"

	var dataSource: DataSource {
		return autoDiffDataSource
	}

	lazy var actions: [ExampleViewModelAction] = {
		return [ExampleViewModelAction(title: "Random") {
			[weak self] in self?.random()
		}]
	}()

	let autoDiffDataSource = AutoDiffDataSource(StaticData.randomItems()) {
		$0 === $1
	}

	func random() {
		self.autoDiffDataSource.items.value = StaticData.randomItems()
	}

}
