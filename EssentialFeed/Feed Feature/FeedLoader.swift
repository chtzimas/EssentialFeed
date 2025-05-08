//
//  Copyright © Essential Developer. All rights reserved.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>
	
public protocol FeedLoader {
    
    associatedtype Error: Swift.Error
    
	func load(completion: @escaping (LoadFeedResult) -> Void)
}
