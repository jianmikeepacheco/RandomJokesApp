//
//  JokesViewController.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/25/22.
//

import Foundation
import UIKit

class JokesVC: UIViewController {
    
    var dataTask: URLSessionDataTask?
    var jokeCell: JokeCell?
    
    // MARK: - the setup for the interface of the app: UILabel & UIButton
    
    // UILabel - to show the setup
    private lazy var setupLabel: CustomLabel = {
        let text = ""
        let label = CustomLabel(text: text)
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    // UILabel - to show the punchline
    private lazy var setupPunchline: CustomLabel = {
        let text = ""
        let label = CustomLabel(text: text)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        
        return label
    }()
    
    // CusmtomButtonLoad - to load the joke
    private lazy var refreshButton: CustomButton = {
        let image = UIImage(systemName: "arrow.clockwise")
        let button = CustomButton(icon: image )
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(loadJoke), for: .touchUpInside)
        
        return button
    }()
    
    // CusmtomButtonSave - to save the joke
    private lazy var saveButton: CustomButton = {
        let image = UIImage(systemName: "heart")
        let button = CustomButton(icon: image)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(saveJoke), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Set the text
    
    var jokes: Jokes? {
        didSet {
            guard let jokes = jokes else { return }
            
            setupLabel.text = "\(jokes.first?.setup ?? "")"
            setupLabel.sizeToFit()
            
            setupPunchline.text = "- \(jokes.first?.punchline ?? "")"
            setupPunchline.sizeToFit()
        }
    }
    
    // MARK: - Setup before loading the view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        // add the labels to the screen
        view.addSubview(setupLabel)
        view.addSubview(setupPunchline)
        
        // add the buttons to the screen
        view.addSubview(refreshButton)
        view.addSubview(saveButton)
        
        // set the constraints from func below
        setConstraints()
        
        // to load the data
        loadJoke()
    }
    
    // MARK: - Setup the constraints so UIKit knows how to layout above views
    
    private func setConstraints() {
        setupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true // constraint for leading position
        setupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true // constraint for trailing position
        setupLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true // constraint for the y-position
        
        setupPunchline.topAnchor.constraint(equalTo: setupLabel.bottomAnchor, constant: 20).isActive = true
        setupPunchline.leadingAnchor.constraint(equalTo: setupLabel.leadingAnchor).isActive = true
        setupPunchline.trailingAnchor.constraint(equalTo: setupLabel.trailingAnchor).isActive = true
        
        refreshButton.topAnchor.constraint(equalTo: setupPunchline.bottomAnchor, constant: 20).isActive = true
        refreshButton.leadingAnchor.constraint(equalTo: setupPunchline.leadingAnchor).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: setupPunchline.bottomAnchor, constant: 20).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: setupPunchline.leadingAnchor, constant: 40).isActive = true
    }
    
}


// MARK: - SAVE BUTTON - save random joke into the favorites screen

extension JokesVC {

    @objc private func saveJoke() {
        let alert = UIAlertController(title: "Success",
                                      message: "Added to Favorites",
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in

            let faveVC = FavoritesVC()

            let setup = self.jokes?.first?.setup ?? ""
            let punchline = self.jokes?.first?.punchline ?? ""

            faveVC.createItem(setup: setup, punchline: punchline)

        })
        )
        present(alert, animated: true)
    }

}
