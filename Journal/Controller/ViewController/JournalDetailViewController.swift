//
//  JournalDetailViewController.swift
//  Journal
//
//  Created by Pete Parks on 4/16/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

class JournalDetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var journalNameTextFieldOutlet: UITextField!
    
    // MARK: Properties
    var journal: Journal? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         resignFirstResponder()
    }*/
    
    func updateViews() {
        guard let journal = self.journal, self.isViewLoaded else { return }
        journalNameTextFieldOutlet.text = journal.title
    }
    
    // MARK: Actions
    
    @IBAction func addJournalButtonOutlet(_ sender: UIButton) {
        guard let title = journalNameTextFieldOutlet.text else { return }
        guard let journal = journal else {
            print("Should have added journal \(title)")
            return JournalController.sharedInstance.add(title: title, description: "fix later")
        }
        JournalController.sharedInstance.update(journal: journal, title: title, description: "fix later")
        dismiss(animated: true)
        journalNameTextFieldOutlet.text = ""
    }
    


}
