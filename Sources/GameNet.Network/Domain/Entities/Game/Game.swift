//
//  Game.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct Game: Identifiable, Equatable {
    public var id: String?
    public var name: String
    public var cover: Data?
    public var coverURL: String?
    public var platformId: String
    public var platform: String?

    public init(id: String?,
                name: String,
                cover: Data?,
                coverURL: String?,
                platformId: String,
                platform: String
    ) {
        self.id = id
        self.name = name
        self.cover = cover
        self.coverURL = coverURL
        self.platformId = platformId
        self.platform = platform
    }

    public func toRequest() -> GameEditRequest {
        return GameEditRequest(id: self.id,
                               name: self.name,
                               cover: self.cover ?? Data(),
                               platformId: self.platformId
        )
    }
}
