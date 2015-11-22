//
//  ExampleCollectionViewReusableView.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveCocoa

class ExampleCollectionViewReusableView: CollectionViewReusableView, Disposing {

	@IBOutlet var titleLabel: UILabel?

	let disposable = CompositeDisposable()

	deinit {
		disposable.dispose()
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		self.item.producer
			.map { $0 as? String }
			.ignoreNil()
			.start(self, ExampleCollectionViewReusableView.configureWithItem)
	}

	func configureWithItem(item: String) {
		self.titleLabel?.text = item
	}

}
