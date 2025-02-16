//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Christos Tzimas on 16/2/25.
//

import XCTest

class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
}

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        
        // Given
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        // Then
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        
        // Given
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        // When
        sut.load()
        
        // Then
        XCTAssertNotNil(client.requestedURL)
    }
}
