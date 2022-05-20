//
//  Gameplay.swift
//  
//
//  Created by Alliston Aleixo on 20/05/22.
//

import Foundation

public struct Gameplay {
    public var start: Date
    public var finish: Date?
    
    public init(start: Date, finish: Date?) {
        self.start = start
        self.finish = finish
    }
}
