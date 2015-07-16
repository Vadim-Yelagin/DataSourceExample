//
//  ProxyViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import UIKit
import ReactiveCocoa

final class ProxyViewModel: ExampleViewModel {
    
    let title = "Static (sections)"
    
    var dataSource: DataSource {
        return proxyDataSource
    }
    
    lazy var actions: [ExampleViewModelAction] = {
        return [ExampleViewModelAction(title: "Random") {
            [weak self] in self?.random()
        }]
    }()
    
    let proxyDataSource: ProxyDataSource = {
        let result = ProxyDataSource(ProxyViewModel.randomDataSource())
        result.animatesChanges.value = true
        return result
    }()
    
    func random() {
        self.proxyDataSource.innerDataSource.value = ProxyViewModel.randomDataSource()
    }
    
    static func randomTitle() -> String {
        let nf = NSNumberFormatter()
        nf.numberStyle = .SpellOutStyle
        let i = arc4random_uniform(1000)
        return nf.stringFromNumber(NSNumber(unsignedInt: i))!
    }
    
    static func randomSection() -> StaticDataSourceSection<ExampleItem> {
        let n = 1 + arc4random_uniform(5)
        let items = (0 ..< n).map { _ in
            ExampleItem(self.randomTitle())
        }
        let title = self.randomTitle()
        return StaticDataSourceSection(items: items,
            supplementaryItems: [UICollectionElementKindSectionHeader: title])
    }
    
    static func randomDataSource() -> StaticDataSource<ExampleItem> {
        let n = 1 + arc4random_uniform(5)
        let sections = (0 ..< n).map { _ in
            self.randomSection()
        }
        return StaticDataSource(sections: sections)
    }
    
}
