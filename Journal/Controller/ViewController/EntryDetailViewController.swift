//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Pete Parks on 4/15/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    // MARK: Properties
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         resignFirstResponder()
    }
    
    func updateViews() {
        guard let entry = entry, self.isViewLoaded else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.entryText
    }
    
    // MARK: Actions
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        titleTextField.text = ""
        bodyTextView.text = ""
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, let entryText = bodyTextView.text else { return }
        guard let entry = entry else {
            return EntryController.sharedInstance.add(title: title, entryText: entryText)
        }
        EntryController.sharedInstance.update(entry: entry, title: title, text: entryText)
        dismiss(animated: true)
    }

}
