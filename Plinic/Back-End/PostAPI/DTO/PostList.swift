//
//  PostList.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/19.
//

import Foundation

struct PostList: Codable {
    
    let count: Int
    var next: String?
    var results: [Post]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case results
    }
    
    static func create() -> PostList {
        // FIXME: Refactor
        
        return .init(count: 0, next: "", results: [])
    }
    
    static func createEmpty() -> Self {
        return .init(
            count: -1,
            next: nil,
            results: []
        )
    }
    
    static func createMock() -> Self {
        return .init(
            count: 1,
            next: "",
            results: [
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock()
            ]
        )
    }
}

