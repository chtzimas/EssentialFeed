//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Christos Tzimas on 16/2/25.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTest {
    
    func test_init_doesNotRequestDataFromURL() {
        
        // Given
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        // Then
        XCTAssertNil(client.requestedURL)
    }
}
