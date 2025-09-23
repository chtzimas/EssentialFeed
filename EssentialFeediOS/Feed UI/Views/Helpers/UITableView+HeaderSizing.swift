//
//  UITableView+HeaderSizing.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 21/9/25.
//

import UIKit

extension UITableView {
    
    func sizeTableHeaderToFit() {
        
        guard let header = tableHeaderView else { return }

        let size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)

        let needsFrameUpdate = header.frame.height != size.height
        if needsFrameUpdate {
            header.frame.size.height = size.height
            tableHeaderView = header
        }
    }
}
