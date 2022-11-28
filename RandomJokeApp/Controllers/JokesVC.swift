//
//  JokesViewController.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/25/22.
//

import Foundation
import UIKit

class JokesVC: UIViewController {
    
    // the setup for the interface of the app: UILabel & UIButton
    // UILabel - to show the joke
    private lazy var label: UILabel = {
        let label  = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // no limit to number of lines the label can hold
        label.text = "Thinking of a joke..." // default label
        label.sizeToFit()
        return label
    }()
    
    // UIButton - to fetch the joke
    private lazy var refreshButton: UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(systemName: "arrow.clockwise")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // UIButton - to fetch the joke
    private lazy var saveButton: UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(systemName: "heart")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var jokes: Jokes? {
        didSet {
            guard let jokes = jokes else { return }

            label.text = "\(jokes.first?.setup ?? "")\n\n\(jokes.first?.punchline ?? "")"
            label.sizeToFit()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        // add the views to the screen
        view.addSubview(label)
        view.addSubview(refreshButton)
        view.addSubview(saveButton)
        
        // set the constraints from func below
        setConstraints()
        
        // to load the data
        loadData()
        
        // to save the joke as favorite
        //saveJoke()
    }
    
    // setup the constraints so UIKit knows how to layout above views
    private func setConstraints() {
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true // constant is the padding size
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true // constraint for the y-position
        
        refreshButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true // constraint for the refresh button
        refreshButton.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true // constraint for the save button
        saveButton.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 40).isActive = true
    }
    
    // to load the data into the view
    private var dataTask: URLSessionDataTask?
    
    @objc func loadData() {
        
        guard let url = Constants.Urls.allJokes else {
            return
        }
        
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let decodedData = try? JSONDecoder().decode(Jokes.self, from: data) {
                DispatchQueue.main.async {
                    self.jokes = decodedData
                }
            }
        }
        dataTask?.resume()
    }
    
}
