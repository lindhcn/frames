//
//  Item.swift
//  qux
//
//  Created by linda han on 2026-02-05.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
