//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 18/5/25.
//

import EssentialFeed
import UIKit

public final class FeedViewController: UITableViewController {
    
    private var loader: FeedLoader?
    private var viewAppeared = false
    
    public convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }

    public override func viewDidLoad() {
        
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        load()
    }
    
    public override func viewIsAppearing(_ animated: Bool) {
        
        super.viewIsAppearing(animated)
        
        if !viewAppeared {
            refresh()
            viewAppeared = true
        }
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        load()
    }
    
    @objc private func load() {
        loader?.load { [weak self] _ in
            self?.refreshControl?.endRefreshing()
        }
    }
}
