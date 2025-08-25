//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 23/8/25.
//

import Foundation

public protocol FeedCache {
    
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
