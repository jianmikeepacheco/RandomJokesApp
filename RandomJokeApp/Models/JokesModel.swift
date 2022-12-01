//
//  JokesModel.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/25/22.
//

import Foundation

typealias Jokes = [Joke]

struct Joke: Codable {
    
    var setup: String?
    var punchline: String?
    
}


