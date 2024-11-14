//
//  GameplaySession.swift
//
//  Created by Alliston Aleixo on 20/05/22.
//

import Foundation

public struct GameplaySession: Identifiable, Equatable, Hashable {

    // MARK: Lifecycle

    public init(
        id: String?,
        userGameId: String,
        start: Date,
        finish: Date?,
        gameName: String,
        gameCover: String,
        platformName: String,
        totalGameplayTime: String
    ) {
        self.id = id
        self.userGameId = userGameId
        self.start = start
        self.finish = finish
        self.gameName = gameName
        self.gameCover = gameCover
        self.platformName = platformName
        self.totalGameplayTime = totalGameplayTime
    }

    // MARK: Public

    public var id: String?
    public var userGameId: String
    public var start: Date
    public var finish: Date?
    public var gameName: String
    public var gameCover: String
    public var platformName: String
    public var totalGameplayTime: String
    
    public func toRequest() -> GameplaySessionRequest {
        return GameplaySessionRequest(
            userGameId: userGameId,
            start: start,
            finish: finish,
            id: id
        )
    }
}
