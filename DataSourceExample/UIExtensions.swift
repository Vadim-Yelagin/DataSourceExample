//
//  UIExtensions.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 22/05/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func deselectAllRows(animated: Bool) {
        if let indexPaths = self.indexPathsForSelectedRows() as? [NSIndexPath] {
            for indexPath in indexPaths {
                self.deselectRowAtIndexPath(indexPath, animated: animated)
            }
        }
    }
    
}

extension UICollectionView {
    
    func deselectAllRows(animated: Bool) {
        if let indexPaths = self.indexPathsForSelectedItems() as? [NSIndexPath] {
            for indexPath in indexPaths {
                self.deselectItemAtIndexPath(indexPath, animated: animated)
            }
        }
    }
    
}
