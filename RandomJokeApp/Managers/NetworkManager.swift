//
//  NetworkManager.swift
//  RandomJokeApp
//
//  Created by jian.mikee.pacheco on 11/28/22.
//

import UIKit

// MARK: - REFRESH BUTTON - load random joke into the main screen

extension JokesVC {
    
    @objc func loadJoke() {
        
        guard let url = Constants.Urls.allJokes else { return }
        
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
