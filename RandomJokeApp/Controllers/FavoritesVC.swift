//
//  FavoritesVC.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/28/22.
//

import UIKit 

class FavoritesVC: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    var jokes = [SavedJokes]()
    
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
    
    func configureTableView() {
        tableView.register(JokeCell.self, forCellReuseIdentifier: JokeCell.reuseIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        tableView.rowHeight = 70
    }
    
}

