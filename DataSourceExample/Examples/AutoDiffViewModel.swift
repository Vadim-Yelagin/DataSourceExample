//
//  AutoDiffViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import ReactiveCocoa

final class AutoDiffViewModel: ExampleViewModel {
    
    let title = "Auto Diff"
    
    var dataSource: DataSource {
        return autoDiffDataSource
    }
    
    lazy var actions: [ExampleViewModelAction] = {
        return [ExampleViewModelAction(title: "Random") {
            [weak self] in self?.random()
        }]
    }()
    
    let autoDiffDataSource = AutoDiffDataSource(RandomData.items()) {
        $0.title == $1.title
    }
    
    func random() {
        self.autoDiffDataSource.items.value = RandomData.items()
    }
    
}
