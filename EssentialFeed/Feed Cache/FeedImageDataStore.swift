//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 29/7/25.
//

import Foundation

public protocol FeedImageDataStore {
    
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
