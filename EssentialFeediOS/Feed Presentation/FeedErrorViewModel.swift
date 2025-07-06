//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 6/7/25.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        FeedErrorViewModel(message: message)
    }
}
