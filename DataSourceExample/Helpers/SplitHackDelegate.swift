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
    
    func splitViewController(splitViewController: UISplitViewController,
        collapseSecondaryViewController secondaryViewController:UIViewController!,
        ontoPrimaryViewController primaryViewController:UIViewController!) -> Bool
    {
        if let nc = secondaryViewController as? UINavigationController,
            vc = nc.topViewController as? ExampleViewController
            where vc.viewModel == nil
        {
            return true
        }
        return false
    }

}
