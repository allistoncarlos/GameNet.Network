//
//  PlatformGames.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct PlatformGame: Identifiable {
    public var id: String?
    public var name: String
    public var platformGamesTotal: Int

    public init(id: String?,
                name: String,
                platformGamesTotal: Int
    ) {
        self.id = id
        self.name = name
        self.platformGamesTotal = platformGamesTotal
    }
}

public struct PlatformGames: Identifiable {
    public let id = UUID()
    public var total: Int
    public var platforms: [PlatformGame]
    
    public init(total: Int, platforms: [PlatformGame]) {
        self.total = total
        self.platforms = platforms
    }
}
