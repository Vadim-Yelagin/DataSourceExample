//
//  CompositeViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import ReactiveCocoa

private func randomItems() -> [ExampleItem] {
    return RandomData.items(count: 5, value: 4)
}

final class CompositeViewModel: ExampleViewModel {
    
    let title = "Composite (two auto diffs)"
    
    lazy var dataSource: DataSource = {
        return CompositeDataSource([self.autoDiff1, self.autoDiff2])
    }()
    
    lazy var actions: [ExampleViewModelAction] = {
        return [ExampleViewModelAction(title: "Random 1") {
                [weak self] in self?.random1()
            }, ExampleViewModelAction(title: "Random 2") {
                [weak self] in self?.random2()
            }]
    }()
    
    let autoDiff1 = AutoDiffDataSource(randomItems(),
        supplementaryItems: [UICollectionElementKindSectionHeader: "First Auto Diff"])
        {
            $0.title == $1.title
        }
    
    let autoDiff2 = AutoDiffDataSource(randomItems(),
        supplementaryItems: [UICollectionElementKindSectionHeader: "Second Auto Diff"]) {
            $0.title == $1.title
        }
    
    func random1() {
        self.autoDiff1.items.value = randomItems()
    }
    
    func random2() {
        self.autoDiff2.items.value = randomItems()
    }
    
}
