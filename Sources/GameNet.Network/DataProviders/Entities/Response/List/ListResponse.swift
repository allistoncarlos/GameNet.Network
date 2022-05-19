//
//  ListResponse.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct ListResponse: Identifiable, Codable {
    public var id: String?
    public var name: String
    public var userId: String
    public var creationDate: Date

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userId
        case creationDate
    }
    
    public func toList() -> List {
        return List(id: self.id, name: self.name)
    }
}
