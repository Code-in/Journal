//
//  Journal.swift
//  Journal
//
//  Created by Pete Parks on 4/16/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import Foundation

class Journal: Codable {
    // MARK: Properties
    var timestamp: Date
    var title: String
    var description: String
    var entries: [Entry] = []
    
    init(timestamp: Date = Date(), title: String, description: String) {
        self.timestamp = timestamp
        self.title = title
        self.description = description
    }
    
    // MARK: Entry - CRUD
    
    // MARK: Create
    func add(title: String, entryText: String) {
        let entry = Entry(timestamp: Date(), title: title, entryText: entryText)
        entries.append(entry)
        //(*)saveToPersistentStore()
    }
    
    // MARK: Remove
    func remove(entry: Entry) {
        guard let entryIndex = entries.firstIndex(of: entry) else { return }
        entries.remove(at: entryIndex)
        //(*)saveToPersistentStore()
    }
    
    // MARK: Update
    func update(entry: Entry, title: String, entryText: String) {
        guard let entryIndex = entries.firstIndex(of: entry) else { return }
        entries[entryIndex].timestamp = Date()
        entries[entryIndex].title = title
        entries[entryIndex].entryText = entryText
        //(*)saveToPersistentStore()
    }
    
}

    // MARK: equality "==" equatable
extension Journal: Equatable {
    static func ==(lhs: Journal, rhs: Journal) -> Bool {
        return lhs.timestamp == rhs.timestamp && lhs.title == rhs.title && lhs.description == rhs.description
    }
}
