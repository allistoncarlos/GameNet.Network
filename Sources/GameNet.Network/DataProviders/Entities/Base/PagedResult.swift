//
//  PagedResult.swift
//
//  Created by Alliston Aleixo on 18/05/22.
//

import Foundation

public struct PagedResult<T: Codable>: Codable {
    public var count: Int
    public var totalCount: Int
    public var page: Int?
    public var pageSize: Int?
    public var search: String?
    public var result: [T]

    var totalPages: Int

    enum CodingKeys: String, CodingKey {
        case count
        case totalCount
        case page
        case pageSize
        case search
        case result

        case totalPages
    }
}
