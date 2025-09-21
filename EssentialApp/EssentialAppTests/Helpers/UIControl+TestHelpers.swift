//
//  UIControl+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Christos Tzimas on 28/5/25.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
