//
//  FeedPresentationTests.swift
//  EssentialFeedTests
//
//  Created by Christos Tzimas on 8/7/25.
//

import XCTest

final class FeedPresenter {
     
    let view: Any
    
    init(view: Any) {
        self.view = view
    }
}

final class FeedPresenterTests: XCTestCase {
    
   func test_init_doesNotSendMessagesToView() {
        
       let (_, view) = makeSUT()
       
       XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }
    
    private final class ViewSpy {
        var messages = [Any]()
    }
}
