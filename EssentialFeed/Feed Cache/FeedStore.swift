//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 15/3/25.
//

import Foundation

public enum RetrieveCachedFeedResult {
    case found(feed: [LocalFeedImage], timestamp: Date)
    case empty
    case failure(Error)
}

public protocol FeedStore {
    
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    typealias RetrievalCompletion = (RetrieveCachedFeedResult) -> Void
    
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}
