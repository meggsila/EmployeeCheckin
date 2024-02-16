//
//  DatabaseManager.swift
//  EmployeeCheckin
//
//  Created by Megi on 5.2.24.
//

import Foundation
import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "EmployeeCheckin")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Error \(error), \(error.userInfo)")
            }
        })
        //container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }()
    
    //MARK: - Core Data Saving support
    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - Checkin Date Time
    func saveCheckinDateTime(checkinDateTime: String) {
        let context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "check_in_date_time == %@", checkinDateTime)
        
        do {
            let existingEmployees = try context.fetch(fetchRequest)
            
            if let existingEmployee = existingEmployees.first {
                existingEmployee.check_in_date_time = checkinDateTime
            } else {
                let employeeInstance = Employee(context: context)
                employeeInstance.check_in_date_time = checkinDateTime
            }
            
            try context.save()
        } catch {
            print("Error \(error)")
        }
    }

    func fetchCheckinDateTime() -> String? {
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()

        do {
            let employees = try persistentContainer.viewContext.fetch(fetchRequest)

            if let checkinDateTime = employees.last?.check_in_date_time {
                return checkinDateTime
            }
        } catch {
            print("Error \(error)")
        }

        return nil
    }
}
