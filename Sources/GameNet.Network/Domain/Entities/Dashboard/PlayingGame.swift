//
//  PlayingGame.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct PlayingGame: Identifiable, Equatable {
    public var id: String?
    public var name: String
    public var platform: String
    public var latestGameplaySession: LatestGameplaySession?

    public init(id: String?,
                name: String,
                platform: String,
                latestGameplaySession: LatestGameplaySession?
    ) {
        self.id = id
        self.name = name
        self.platform = platform
        self.latestGameplaySession = latestGameplaySession
    }
}
