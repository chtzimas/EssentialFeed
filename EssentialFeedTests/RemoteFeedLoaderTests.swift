//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Christos Tzimas on 16/2/25.
//

import XCTest

class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }
}

class HTTPClient {
    
    static var shared = HTTPClient()
    
    var requestedURL: URL?
    
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    
    override func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        
        // Given
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader()
        
        // Then
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        
        // Given
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        // When
        sut.load()
        
        // Then
        XCTAssertNotNil(client.requestedURL)
    }
}
