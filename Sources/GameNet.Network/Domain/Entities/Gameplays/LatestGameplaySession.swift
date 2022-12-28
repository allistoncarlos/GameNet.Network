//
//  LatestGameplaySession.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct LatestGameplaySession: Identifiable, Equatable {
    public var id: String?
    public var userGameId: String
    public var start: Date
    public var finish: Date?
    
    public init(id: String?,
                userGameId: String,
                start: Date,
                finish: Date?
    ) {
        self.id = id
        self.userGameId = userGameId
        self.start = start
        self.finish = finish
    }
}
