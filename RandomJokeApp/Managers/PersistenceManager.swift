//
//  PersistenceManager.swift
//  RandomJokeApp
//
//  Created by jian.mikee.pacheco on 11/28/22.
//

import CoreData

// MARK: - Core Data Support

extension FavoritesVC {
    
    func getAllItems() {
        do {
            jokes = try context.fetch(SavedJokes.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            fatalError()
        }
    }
    
    func saveItems() {
        do {
            try context.save()
            getAllItems()
        }
        catch {
            fatalError()
        }
    }

    func createItem(setup: String, punchline: String) {
        let newItem = SavedJokes(context: context)
        
        newItem.setup = setup
        newItem.punchline = punchline
        
        saveItems()
    }
    
    func deleteItem(item: SavedJokes) {
        context.delete(item)
        
        saveItems()
    }

}

