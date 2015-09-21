//
//  ProxyViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import UIKit
import ReactiveCocoa

final class ProxyViewModel: ExampleViewModel {

	let title = "Proxy"

	var dataSource: DataSource {
		return proxyDataSource
	}

	lazy var actions: [ExampleViewModelAction] = {
		return [ExampleViewModelAction(title: "Random") {
			[weak self] in self?.random()
		}]
	}()

	let proxyDataSource: ProxyDataSource = {
		let result = ProxyDataSource(RandomData.dataSource())
		result.animatesChanges.value = true
		return result
	}()

	func random() {
		self.proxyDataSource.innerDataSource.value = RandomData.dataSource()
	}

}
