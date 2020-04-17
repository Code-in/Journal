//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Pete Parks on 4/15/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

private let cellIdentifier = "entryCell"
private let segueIdentifier = "detailSegue"

class EntryListTableViewController: UITableViewController {
    
    // MARK: Properties
    var journal: Journal? {
        didSet {
            //updateViews()
        }
    }
    
    
    // Mark: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //(*)EntryController.sharedInstance.loadFromPersistentStore()

    }
    
    // This is going to update song count in playlists if a song is added
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let entry = EntryController.sharedInstance.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            EntryController.sharedInstance.remove(entry: entry)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // IIDO
        // Identifier
        if segue.identifier == segueIdentifier {
            // Index - What cell triggered the segue
            // Destination
            guard let indexPath = tableView.indexPathForSelectedRow, let dstVC = segue.destination as? EntryDetailViewController else { return }
            // Object to send - What am I trying to send to the next view?
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            // Object to Recieve - Where is this data sent
            dstVC.entry = entry
        }
    }
}
