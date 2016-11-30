//
//  SplitHackDelegate.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import UIKit

final class SplitHackDelegate: NSObject, UISplitViewControllerDelegate {

	func splitViewController(_ splitViewController: UISplitViewController,
		collapseSecondary secondaryViewController:UIViewController,
		onto primaryViewController:UIViewController) -> Bool
	{
		if let nc = secondaryViewController as? UINavigationController,
			let vc = nc.topViewController as? ExampleViewController, vc.viewModel == nil
		{
			return true
		}
		return false
	}

}
