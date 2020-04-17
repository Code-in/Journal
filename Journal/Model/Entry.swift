//
//  Entry.swift
//  Journal
//
//  Created by Pete Parks on 4/15/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import Foundation

class Entry: Codable {
    var timestamp: Date
    var title: String
    var entryText: String
    
    init(timestamp: Date = Date(), title: String, entryText: String) {
        self.timestamp = timestamp
        self.title = title
        self.entryText = entryText
    }
}

    // MARK: equality "==" equatable
extension Entry: Equatable {
    static func ==(lhs: Entry, rhs: Entry) -> Bool {
        return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.entryText == rhs.entryText
    }
}
