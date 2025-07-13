//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 13/7/25.
//

public struct FeedImageViewModel<Image> {
    
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool
    
    public var hasLocation: Bool {
        location != nil
    }
}
