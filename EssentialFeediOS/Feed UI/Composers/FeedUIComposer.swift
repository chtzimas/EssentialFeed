//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 5/6/25.
//

import UIKit
import EssentialFeed

public final class FeedUIComposer {
    
    private init() {}

    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(
            feedLoader: MainQueueDispatchDecorator(decoratee: feedLoader)
        )
        let feedController = makeWith(
            delegate: presentationAdapter,
            title: FeedPresenter.title
        )
        let feedView = FeedViewAdapter(
            controller: feedController,
            imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)
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
