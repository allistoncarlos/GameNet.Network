//
//  ListGame.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct ListGame: Identifiable, Equatable, Hashable {

    // MARK: Lifecycle

    public init(
        id: String?,
        name: String,
        games: [ListItem]?
    ) {
        self.id = id
        self.name = name
        self.games = games
    }

    // MARK: Public

    public var id: String?
    public var name: String
    public var games: [ListItem]?
    
    public func toRequest() -> ListGameRequest {
        return ListGameRequest(id: id, name: name)
    }

}
