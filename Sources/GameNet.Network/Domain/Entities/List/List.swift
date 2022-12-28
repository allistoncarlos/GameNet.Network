//
//  List.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation

public struct List: Identifiable, Equatable {
    public var id: String?
    public var name: String

    public init(id: String?,
                name: String
    ) {
        self.id = id
        self.name = name
    }

    public func toRequest() -> ListRequest {
        return ListRequest(id: self.id, name: self.name)
    }
}
