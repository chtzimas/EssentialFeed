//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Christos Tzimas on 7/6/25.
//

struct FeedImageViewModel<Image> {
    
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
