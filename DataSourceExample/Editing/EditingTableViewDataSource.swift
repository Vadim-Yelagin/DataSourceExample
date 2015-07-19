//
//  EditingTableViewDataSource.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import UIKit
import DataSource

class EditingTableViewDataSource: TableViewDataSource {
 
    let mutableDataSource = MutableDataSource(StaticData.items)
    
    override init() {
        super.init()
        self.dataSource.innerDataSource.value = self.mutableDataSource
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath)
    {
        self.mutableDataSource.deleteItemAtIndex(indexPath.row)
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView,
        moveRowAtIndexPath sourceIndexPath: NSIndexPath,
        toIndexPath destinationIndexPath: NSIndexPath)
    {
        self.mutableDataSource.moveItemAtIndex(index: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }
    
}
