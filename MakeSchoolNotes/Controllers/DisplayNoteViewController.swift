//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class DisplayNoteViewController: UIViewController {
    var note : Note?

    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if let note = note {
            
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listNotesTableViewController = segue.destination as! ListNotesTableViewController
        if segue.identifier == "Save" {
            if let note = note {
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                listNotesTableViewController.tableView.reloadData()
            } else {
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? ""
                note.modificationTime = Date() as NSDate
                listNotesTableViewController.notes.append(note)
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
