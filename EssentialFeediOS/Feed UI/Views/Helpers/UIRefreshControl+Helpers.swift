//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 6/7/25.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
