//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 7/11/25.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
