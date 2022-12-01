//
//  FavoritesVC.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/28/22.
//

import UIKit
import CoreData

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private var jokes = [SavedJokes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        configureTableView()
        
        view.addSubview(tableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAllItems()
    }
    
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let joke = jokes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: JokeCell.reuseIdentifier, for: indexPath) as! JokeCell
        
        cell.setup.text = joke.setup ?? ""
        cell.punchline.text = "- \(joke.punchline ?? "")"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let item = jokes[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { [self] (_, _, completionHandler) in
            self.deleteItem(item: item)
        }
        
        deleteAction.backgroundColor = UIColor.systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return configuration
    }
    
    func configureTableView() {
        tableView.register(JokeCell.self, forCellReuseIdentifier: JokeCell.reuseIdentifier)
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        tableView.rowHeight = 70
    }
    
    // MARK: - CORE DATA
    
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

