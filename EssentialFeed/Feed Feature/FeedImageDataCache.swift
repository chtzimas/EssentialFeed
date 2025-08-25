//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 23/8/25.
//

import Foundation

public protocol FeedImageDataCache {
    
    typealias Result = Swift.Result<Void, Error>

    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
