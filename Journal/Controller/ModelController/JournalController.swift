//
//  JournalController.swift
//  Journal
//
//  Created by Pete Parks on 4/16/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import Foundation

private var jsonFileName: String = "journal.json"


class JournalController {
    
    // MARK: Shared Instance
    static let sharedInstance = JournalController()
    
    // Journal X  (name, timestamp, description) -> [Entry, Entry, ...]
    // Journal Y (name, timestamp, description) -> [Entry, Entry, Entry, ...]
    // MARK: Properties
    var journals: [Journal] = []
    
    // MARK: Journal - CRUD
    // MARK: Create
    func add(title: String, description: String) {
        let journal = Journal(timestamp: Date(), title: title, description: description)
        journals.append(journal)
        //(*)saveToPersistentStore()
    }
    
    // MARK: Remove
    func remove(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
        //(*)saveToPersistentStore()
    }
    
    // MARK: Update
    func update(journal: Journal, title: String, description: String) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals[index].timestamp = Date()
        journals[index].title = title
        journals[index].description = description
        //(*)saveToPersistentStore()
    }

}

    // Mark: Delete
    //(*) Need to add
 
    //MARK: Persistance
    
    /*
    func createJsonFilePersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
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
    
    

