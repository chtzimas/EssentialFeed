//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Christos Tzimas on 13/5/25.
//

import EssentialFeed
import EssentialFeediOS
import XCTest

final class FeedViewControllerTests: XCTestCase {
    
    func test_loadFeedActions_requestFeedFromLoader() {
        
        let (_, loader) = makeSUT()

        XCTAssertEqual(loader.loadCallCount, 0, "Expected no loading requests before view is loaded")
    }
    
    func test_pullToRefresh_loadsFeed() {
        
        let (sut, _) = makeSUT()
        
        sut.simulateAppearance()
        XCTAssertTrue(sut.isShowingLoadingIndicator)
        
        sut.refreshControl?.endRefreshing()
        sut.refreshControl?.beginRefreshing()
        sut.refreshControl?.sendActions(for: .valueChanged)
        XCTAssertTrue(sut.isShowingLoadingIndicator)
        
        sut.refreshControl?.endRefreshing()
        sut.simulateAppearance()
        XCTAssertFalse(sut.isShowingLoadingIndicator)
    }
    
    func test_viewDidLoad_hidesLoadingIndicatorOnLoaderCompletion() {
        
        let (sut, loader) = makeSUT()
        
        sut.loadViewIfNeeded()
        loader.completeFeedLoading(at: 0)
        
        XCTAssertFalse(sut.isShowingLoadingIndicator)
    }
    
    func test_pullToRefresh_showsLoadingIndicator() {
        
        let (sut, _) = makeSUT()
        
        sut.simulateAppearance()
        
        XCTAssertTrue(sut.isShowingLoadingIndicator)
    }
    
    func test_pullToRefresh_hidesLoadingIndicatorOnLoaderCompletion() {
        
        let (sut, loader) = makeSUT()
        
        sut.simulateAppearance()
        loader.completeFeedLoading(at: 0)
        
        XCTAssertFalse(sut.isShowingLoadingIndicator)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedViewController, loader: LoaderSpy) {
        let loader = LoaderSpy()
        let sut = FeedViewController(loader: loader)
        trackForMemoryLeaks(loader, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, loader)
    }

    class LoaderSpy: FeedLoader {
        
        private var completions = [(FeedLoader.Result) -> Void]()
        
        var loadCallCount: Int {
            completions.count
        }
        
        func load(completion: @escaping (FeedLoader.Result) -> Void) {
            completions.append(completion)
        }
        
        func completeFeedLoading(at index: Int) {
            completions[index](.success([]))
        }
    }
}

private extension FeedViewController {
    
    func simulateAppearance() {
        
        if !isViewLoaded {
            loadViewIfNeeded()
            replaceRefreshControlWithFakeForiOS17Support()
        }
        
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
    
    func replaceRefreshControlWithFakeForiOS17Support() {
        
        let fake = FakeRefreshControl()
        
        refreshControl?.allTargets.forEach { target in
            refreshControl?.actions(forTarget: target, forControlEvent: .valueChanged)?.forEach { action in
                fake.addTarget(target, action: Selector(action), for: .valueChanged)
            }
        }
        
        refreshControl = fake
    }
    
    var isShowingLoadingIndicator: Bool {
        refreshControl?.isRefreshing == true
    }
}

private class FakeRefreshControl: UIRefreshControl {
    
    private var _isRefreshing = false
    
    @objc override var isRefreshing: Bool { _isRefreshing }
    
    override func beginRefreshing() {
        _isRefreshing = true
    }
    
    override func endRefreshing() {
        _isRefreshing = false
    }
}
