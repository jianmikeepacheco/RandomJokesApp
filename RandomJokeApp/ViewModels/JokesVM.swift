//
//  JokesViewModel.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/25/22.
//

import Foundation

struct JokesViewModel: Decodable {
    
    private let joke: Jokes
    
    init(joke: Jokes) {
        self.joke = joke
    }
    
    var setup: String? {
        joke.first?.setup
    }
    
    var punchline: String? {
        joke.first?.punchline
    }
}
