//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 19/3/25.
//

import Foundation

 struct RemoteFeedItem: Decodable {
     let id: UUID
     let description: String?
     let location: String?
     let image: URL
}
