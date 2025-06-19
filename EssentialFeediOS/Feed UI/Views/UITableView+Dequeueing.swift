//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 19/6/25.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
