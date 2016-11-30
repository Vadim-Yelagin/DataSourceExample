//
//  ExampleCollectionViewReusableView.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource
import ReactiveSwift
import ReactiveCocoa

class ExampleCollectionViewReusableView: CollectionViewReusableView {

	@IBOutlet var titleLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		let items = self.viewModel.producer
			.map { $0 as? String }
			.skipNil()

		self.titleLabel.reactive.text <~ items
	}

}
