//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Christos Tzimas on 28/5/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
