//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Christos Tzimas on 27/3/25.
//

import Foundation

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    Data("any data".utf8)
}
