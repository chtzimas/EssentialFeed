//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 5/6/25.
//

import UIKit
import Combine
import EssentialFeed
import EssentialFeediOS

public final class FeedUIComposer {
    
    private init() {}

    public static func feedComposedWith(
        feedLoader: @escaping () -> FeedLoader.Publisher,
        imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher
    ) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: feedLoader)
        let feedController = makeWith(
            delegate: presentationAdapter,
            title: FeedPresenter.title
        )
        let feedView = FeedViewAdapter(
            controller: feedController,
            imageLoader: { imageLoader($0).dispatchOnMainQueue() }
        )
        let loadingView = WeakRefVirtualProxy(feedController)
        let errorView = WeakRefVirtualProxy(feedController)
        presentationAdapter.presenter = FeedPresenter(
            feedView: feedView,
            loadingView: loadingView,
            errorView: errorView
        )
        return feedController
    }
    
    private static func makeWith(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = title
        return feedController
    }
}
