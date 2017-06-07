//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Scott Chow on 6/22/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
class NoteBAD: NSManagedObject {
    
    @NSManaged var title = ""
    @NSManaged var content : String?
    @NSManaged var modificationTime : Date?
}
