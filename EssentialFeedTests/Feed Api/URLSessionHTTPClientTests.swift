//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Christos Tzimas on 24/2/25.
//

import EssentialFeed
import XCTest

class URLSessionHTTPClient {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { _, _, error in
            if let error {
                completion(.failure(error))
            }
        }.resume()
    }
}

class URLSessionHTTPClientTests: XCTestCase {
    
    func test_getFromURL_failsOnRequestError() {
        
        // Given
        URLProtocolStub.startInterceptingRequests()
        let url = URL(string: "http://any-url.com")!
        let error = NSError(domain: "any error", code: 1)
        URLProtocolStub.stub(data: nil, response: nil, error: error)
        
        let sut = URLSessionHTTPClient()
        
        let exp = expectation(description: "Wait for completion")
        
        // When
        sut.get(from: url) { result in
            
            // Then
            switch result {
            case let .failure(receivedError as NSError):
                XCTAssertEqual(receivedError.code, error.code)
                XCTAssertEqual(receivedError.domain, error.domain)
            default:
                XCTFail("Expected failure with error \(error), got \(result) instead")
            }
            
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
        URLProtocolStub.stopInterceptingRequests()
    }
    
    // MARK: - Helpers
    
    private class URLProtocolStub: URLProtocol {
        
        private static var stub: Stub?
        
        private struct Stub {
            let data: Data?
            let response: URLResponse?
            let error: Error?
        }
        
        static func stub(data: Data?, response: URLResponse?, error: Error?) {
            stub = Stub(data: data, response: response, error: error)
        }
        
        static func startInterceptingRequests() {
            URLProtocol.registerClass(URLProtocolStub.self)
        }
        
        static func stopInterceptingRequests() {
            URLProtocol.unregisterClass(URLProtocolStub.self)
            stub = nil
        }
        
        override class func canInit(with request: URLRequest) -> Bool {
            true
        }
        
        override class func canonicalRequest(for request: URLRequest) -> URLRequest {
            request
        }
        
        override func startLoading() {
            
            let stub = URLProtocolStub.stub
            
            if let data = stub?.data {
                client?.urlProtocol(self, didLoad: data)
            }
            
            if let response = stub?.response {
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            }
            
            if let error = stub?.error {
                client?.urlProtocol(self, didFailWithError: error)
            }
            
            client?.urlProtocolDidFinishLoading(self)
        }
        
        override func stopLoading() {}
    }
}
