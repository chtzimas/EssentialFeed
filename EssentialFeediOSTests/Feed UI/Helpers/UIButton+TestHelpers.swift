//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Christos Tzimas on 28/5/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
