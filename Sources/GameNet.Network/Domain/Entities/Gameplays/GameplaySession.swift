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
        totalGameplayTime: String
    ) {
        self.id = id
        self.userGameId = userGameId
        self.start = start
        self.finish = finish
        self.totalGameplayTime = totalGameplayTime
    }

    // MARK: Public

    public var id: String?
    public var userGameId: String
    public var start: Date
    public var finish: Date?
    public var totalGameplayTime: String
}
