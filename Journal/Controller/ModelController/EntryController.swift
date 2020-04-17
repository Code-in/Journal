//
//  EntryController.swift
//  Journal
//
//  Created by Pete Parks on 4/15/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

private var jsonFileName: String = "journal.json"

import Foundation

class EntryController {
    
    // MARK: Shared Instance
    static let sharedInstance = EntryController()
    
    
    // MARK: Properties
    
    var entries: [Entry] = []
    
    // MARK: CRUD
    
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
    
    // MARK: Remove
    func removeAll(entry: Entry) {
        guard let entryIndex = entries.firstIndex(of: entry) else { return }
        entries.remove(at: entryIndex)
        //(*)saveToPersistentStore()
    }
    
    // MARK: Update
    func update(entry: Entry, title: String, text: String) {
        guard let entryIndex = entries.firstIndex(of: entry) else { return }
        entries[entryIndex].timestamp = Date()
        entries[entryIndex].title = title
        entries[entryIndex].entryText = text
        //(*)saveToPersistentStore()
    }
 
    //MARK: Persistance
    /*
    func createJsonFilePersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(url)
        return url[0].appendingPathComponent(jsonFileName)
    }
    
    func saveToPersistentStore() {
        let je = JSONEncoder()
        
        do {
            let jsonEntry = try je.encode(self.entries)
            try jsonEntry.write(to: createJsonFilePersistenceStore())
        } catch let e {
            print("Encoding Error \(e.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore() {
        let jd = JSONDecoder()
        
        do {
            let decodeData = try Data(contentsOf: createJsonFilePersistenceStore())
            self.entries = try jd.decode([Entry].self, from: decodeData)
        } catch let e {
            print("Decoding Error \(e.localizedDescription)")
        }
    }
    */
    
}
