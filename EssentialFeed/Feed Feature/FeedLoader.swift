//
//  Copyright © Essential Developer. All rights reserved.
//

import Foundation

public enum LoadFeedResult<Error> {
	case success([FeedImage])
	case failure(Error)
}

public protocol FeedLoader {
    
    associatedtype Error: Swift.Error
    
	func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
