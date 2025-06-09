//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 28/5/25.
//

import UIKit
import EssentialFeed

public final class FeedRefreshViewController: NSObject, FeedLoadingView {
    
    public lazy var view = loadView()

    private let presenter: FeedPresenter

    init(presenter: FeedPresenter) {
        self.presenter = presenter
    }

    @objc func refresh() {
        presenter.loadFeed()
    }
    
    func display(isLoading: Bool) {
        if isLoading {
            view.beginRefreshing()
        } else {
            view.endRefreshing()
        }
    }
    
    private func loadView() -> UIRefreshControl {
        let view = UIRefreshControl()
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
