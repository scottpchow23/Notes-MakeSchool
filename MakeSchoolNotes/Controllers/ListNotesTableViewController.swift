//
//  ListNotesTableViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift
class ListNotesTableViewController: UITableViewController {
    
    var notes: Results<Note>! {
        didSet {
            tableView.reloadData()
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            RealmHelper.deleteNote(notes[indexPath.row])
            notes = RealmHelper.retrieveNotes()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath) as! ListNotesTableViewCell
        
        let row = indexPath.row
        let note = notes[row]
        cell.noteTitleLabel.text = note.title
        cell.noteContentLabel.text = note.content
        cell.noteModificationTimeLabel.text = note.modificationTime.convertToString()
        return cell
    }
    
    @IBAction func unwindToListNotesViewController (segue: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
                let indexPath = tableView.indexPathForSelectedRow!
                let note = notes[indexPath.row]
                let displayNoteViewController = segue.destinationViewController as! DisplayNoteViewController
                displayNoteViewController.note = note
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = RealmHelper.retrieveNotes()
    }
  
}