//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Christos Tzimas on 23/8/25.
//

import EssentialFeed

final class FeedLoaderStub: FeedLoader {
    
    private let result: FeedLoader.Result

    init(result: FeedLoader.Result) {
        self.result = result
    }

    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
