//
//  SplitHackViewController.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 17/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import UIKit

class SplitHackViewController: UISplitViewController {

	override func awakeFromNib() {
		super.awakeFromNib()
		self.preferredDisplayMode = .allVisible
	}

}
