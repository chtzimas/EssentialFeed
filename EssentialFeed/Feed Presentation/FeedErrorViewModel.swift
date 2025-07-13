//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 10/7/25.
//

public struct FeedErrorViewModel {
    
    public let message: String?
    
    public static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }
    
    public static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
