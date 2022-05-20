//
//  GameplaySessionResponse.swift
//
//  Created by Alliston Aleixo on 20/05/22.
//

import Foundation

public struct GameplaySessionResponse: Identifiable, Codable {
    public var id: String?
    public var userGameId: String
    public var start: Date
    public var finish: Date?
    public var totalGameplayTime: String

    enum CodingKeys: String, CodingKey {
        case id
        case userGameId
        case start
        case finish
        case totalGameplayTime
    }
    
    public func toGameplaySession() -> GameplaySession {
        return GameplaySession(id: self.id,
                               userGameId: self.userGameId,
                               start: self.start,
                               finish: self.finish,
                               totalGameplayTime: self.totalGameplayTime)
    }
}
