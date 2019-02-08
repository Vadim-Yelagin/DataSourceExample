//
//  UIExtensions.swift
//  DataSourceExample
//
//  Created by Vadim Yelagin on 22/05/15.
//  Copyright (c) 2015 Fueled. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import Result

extension UITableView {

	func deselectAllRows(_ animated: Bool) {
		if let indexPaths = self.indexPathsForSelectedRows {
			for indexPath in indexPaths {
				self.deselectRow(at: indexPath, animated: animated)
			}
		}
	}

}

extension UICollectionView {

	func deselectAllRows(_ animated: Bool) {
		if let indexPaths = self.indexPathsForSelectedItems {
			for indexPath in indexPaths {
				self.deselectItem(at: indexPath, animated: animated)
			}
		}
	}

}

public extension SignalProducer where Error == NoError {

	public func flatMapLatest<U>(_ transform: @escaping (Value) -> SignalProducer<U, NoError>) -> SignalProducer<U, NoError> {
		return flatMap(.latest, transform)
	}

}

extension Reactive where Base: NSObject {
	public func target<U>(action: @escaping (Base, U) -> Void) -> BindingTarget<U> {
		return BindingTarget(on: ImmediateScheduler(), lifetime: lifetime) {
			[weak base = self.base] value in
			if let base = base {
				action(base, value)
			}
		}
	}
}

extension Reactive where Base: UITableViewCell {
	public var accessoryType: BindingTarget<UITableViewCell.AccessoryType> {
		return target { $0.accessoryType = $1 }
	}
}
