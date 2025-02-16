//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Christos Tzimas on 16/2/25.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    let url: URL
    
    init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        
        // Given
        let client = HTTPClientSpy()
        let url = URL(string: "https://a-url.com")!
        _ = RemoteFeedLoader(client: client, url: url)
        
        // Then
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        
        // Given
        let client = HTTPClientSpy()
        let url = URL(string: "https://a-url.com")!
        let sut = RemoteFeedLoader(client: client, url: url)
        
        // When
        sut.load()
        
        // Then
        XCTAssertEqual(client.requestedURL, url)
    }
}
