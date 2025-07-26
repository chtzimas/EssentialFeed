//
//  HTTPURLResponse+StatusCode.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 26/7/25.
//

import Foundation

extension HTTPURLResponse {
    
    private static var OK_200: Int { 200 }
    
    var isOK: Bool {
        statusCode == HTTPURLResponse.OK_200
    }
}
