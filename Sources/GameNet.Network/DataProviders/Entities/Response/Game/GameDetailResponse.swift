//
//  GameDetailResponse.swift
//
//  Created by Alliston Aleixo on 20/05/22.
//

import Foundation

public struct GameDetailResponse: Identifiable, Codable {
    public var id: String?
    public var name: String
    public var cover: String
    public var platform: String
    public var value: Decimal
    public var boughtDate: Date
    public var gameplays: [GameplayResponse]?

    enum CodingKeys: String, CodingKey {
        case id
        case name = "gameName"
        case cover = "gameCoverURL"
        case platform = "platformName"
        case value
        case boughtDate
        case gameplays
    }
    
    public func toGameDetail() -> GameDetail {
        return GameDetail(id: self.id,
                          name: self.name,
                          cover: self.cover,
                          platform: self.platform,
                          value: self.value,
                          boughtDate: self.boughtDate,
                          gameplays: self.gameplays?.compactMap { $0.toGameplay() })
    }
}
