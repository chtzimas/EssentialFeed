//
//  UIRefreshControl+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Christos Tzimas on 28/5/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
