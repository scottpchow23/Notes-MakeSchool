//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Scott P. Chow on 6/7/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let viewContext = persistentContainer.viewContext

}
