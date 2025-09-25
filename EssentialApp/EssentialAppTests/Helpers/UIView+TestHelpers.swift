//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Christos Tzimas on 25/9/25.
//

import UIKit

extension UIView {
    
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
