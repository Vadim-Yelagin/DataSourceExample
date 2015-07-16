//
//  StaticSectionsViewModel.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 16/07/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import DataSource
import UIKit

final class StaticSectionsViewModel: ExampleViewModel {
    
    let title = "Static (sections)"
    
    let dataSource: DataSource = StaticDataSource(
        sections: [
            StaticDataSourceSection(items: [
                ExampleItem("One"),
                ExampleItem("Two"),
                ExampleItem("Three")
            ], supplementaryItems: [
                UICollectionElementKindSectionHeader: "Section one"
            ]),
            StaticDataSourceSection(items: [
                ExampleItem("Four"),
                ExampleItem("Five")
            ], supplementaryItems: [
                UICollectionElementKindSectionHeader: "Section two"
            ]),
            StaticDataSourceSection(items: [
                ExampleItem("Six"),
                ExampleItem("Seven"),
                ExampleItem("Eight")
            ], supplementaryItems: [
                UICollectionElementKindSectionHeader: "Section three"
            ])
        ])
    
}
