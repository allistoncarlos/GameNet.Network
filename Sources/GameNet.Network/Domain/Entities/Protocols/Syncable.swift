//
//  Syncable.swift
//  GameNet.Network
//
//  Created by Alliston Aleixo on 19/02/25.
//

import Foundation

@objc public protocol Syncable: AnyObject {
    var synced: Bool { get set }
}
