//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 16/2/25.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
