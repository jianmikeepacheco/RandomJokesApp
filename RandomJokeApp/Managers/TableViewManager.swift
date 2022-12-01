//
//  TableViewManager.swift
//  RandomJokeApp
//
//  Created by jian.mikee.pacheco on 12/1/22.
//

import UIKit

//MARK: - TableView Delegate and DataSource

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    
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
    
}
