//
//  MutableViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 19/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import ReactiveCocoa

final class MutableViewModel: ExampleViewModel {
    
    let title = "Mutable"
    
    var dataSource: DataSource {
        return mutableDataSource
    }
    
    lazy var actions: [ExampleViewModelAction] = {
        return [ExampleViewModelAction(title: "Insert") {
            [weak self] in self?.randomInsert()
        }, ExampleViewModelAction(title: "Delete") {
            [weak self] in self?.randomDelete()
        }, ExampleViewModelAction(title: "Move") {
            [weak self] in self?.randomMove()
        }, ExampleViewModelAction(title: "Replace") {
            [weak self] in self?.randomReplace()
        }]
    }()
    
    let mutableDataSource = MutableDataSource(StaticData.randomItems())
    
    func randomInsert() {
        let n = mutableDataSource.items.value.count
        let i = random(n + 1)
        self.mutableDataSource.insertItem(StaticData.randomItem(), atIndex: i)
    }
    
    func randomDelete() {
        let n = mutableDataSource.items.value.count
        if n >= 1 {
            let i = random(n)
            self.mutableDataSource.deleteItemAtIndex(i)
        }
    }
    
    func randomMove() {
        let n = mutableDataSource.items.value.count
        if n >= 2 {
            let i = random(n)
            let j0 = random(n - 1)
            let j = (j0 < i) ? j0 : (j0 + 1)
            self.mutableDataSource.moveItemAtIndex(index: i, toIndex: j)
        }
    }
    
    func randomReplace() {
        let n = mutableDataSource.items.value.count
        if n >= 1 {
            let i = random(n)
            self.mutableDataSource.replaceItemAtIndex(i, withItem: StaticData.randomItem())
        }
    }
    
}
