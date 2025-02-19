//
//  Platform.swift
//
//  Created by Alliston Aleixo on 19/05/22.
//

import Foundation
import SwiftData

@Model
public class Platform: Identifiable, Equatable, Hashable, Syncable {
    // MARK: Lifecycle
    public init(id: String?, name: String, synced: Bool = false) {
        self.id = id
        self.name = name
        
        self.synced = synced
    }

    // MARK: Public
    public var id: String?
    public var name: String
    public var synced: Bool
    
    public func toRequest() -> PlatformRequest {
        return PlatformRequest(id: id, name: name)
    }
}
