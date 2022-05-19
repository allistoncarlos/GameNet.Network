//
//  ListGame.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct ListGame: Identifiable {
    public var id: String?
    public var name: String
    public var games: [ListItem]?

    public init(id: String?,
                name: String,
                games: [ListItem]?
    ) {
        self.id = id
        self.name = name
        self.games = games
    }
}
