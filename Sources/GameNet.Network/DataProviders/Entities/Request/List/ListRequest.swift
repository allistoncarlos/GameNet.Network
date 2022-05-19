//
//  ListRequest.swift
//
//  Created by Alliston Aleixo on 18/05/22.
//

import Foundation

public struct ListRequest: Identifiable, Encodable {
    public var id: String?
    var name: String?
    var userId: String?
    var creationDate: Date?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userId
        case creationDate
    }
}
