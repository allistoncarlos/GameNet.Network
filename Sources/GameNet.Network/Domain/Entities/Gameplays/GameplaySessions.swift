//
//  GameplaySessions.swift
//
//  Created by Alliston Aleixo on 20/05/22.
//

import Foundation

public struct GameplaySessions: Identifiable {
    public var id: String?
    public var sessions: [GameplaySession?]
    public var totalGameplayTime: String
    public var averageGameplayTime: String
    
    public init(id: String?,
                sessions: [GameplaySession?],
                totalGameplayTime: String,
                averageGameplayTime: String
    ) {
        self.id = id
        self.sessions = sessions
        self.totalGameplayTime = totalGameplayTime
        self.averageGameplayTime = averageGameplayTime
    }
}
