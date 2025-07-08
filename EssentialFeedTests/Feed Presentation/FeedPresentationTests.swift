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
        
       let view = ViewSpy()
       
       let _ = FeedPresenter(view: view)
       
       XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    
    // MARK: - Helpers
    
    private final class ViewSpy {
        var messages = [Any]()
    }
}
