//
//  File.swift
//  
//
//  Created by Alliston Aleixo on 18/05/22.
//

import Foundation

public struct UserGameEditRequest: Identifiable, Codable {
    public var id: String?
    public var gameId: String
    public var userId: String
    public var price: Double
    public var boughtDate: Date
    public var have: Bool
    public var want: Bool
    public var digital: Bool
    public var original: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case gameId
        case userId
        case price
        case boughtDate
        case have
        case want
        case digital
        case original
    }
}
