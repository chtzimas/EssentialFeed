//
//  UIButton+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Christos Tzimas on 28/5/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
