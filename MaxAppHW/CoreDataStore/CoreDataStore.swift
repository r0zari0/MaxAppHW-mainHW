
//  CoreDataStore.swift
//  MaxAppHW
//
//  Created by Max Stovolos on 9/30/22.


import Foundation
import CoreData

//protocol CoreDataStoreProtocol {
//
//}
//
class CoreDataStore {

    // MARK: - Core Data stack

    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "CoreDataLesson")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext() {

        if context.hasChanges {
            do {
                try context.save()
                print("Success")
            } catch {

                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchRequest() -> [MyUser] {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()

        do {
            let objects = try context.fetch(fetchRequest)
            return objects.map { MyUser(user: $0) }
        } catch let error {
            print(error)
        }

        return []
    }

    func deleteUsers(id: UUID) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            let objects = try context.fetch(fetchRequest)
            for object in objects {
                context.delete(object)
            }
            saveContext()
            print("Delete")
        } catch {
            print(error)
        }
    }

    func updateUser(myUser: MyUser) {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", myUser.userID as CVarArg)

        do {
            if let user = try context.fetch(fetchRequest).first {
                user.name = myUser.name
                user.lastName = myUser.lastName

                saveContext()
            }

            print("Updated")
        } catch {
            print(error)
        }
    }
}
