//
//  JokesModel.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/25/22.
//

import Foundation

struct Joke: Codable {
    
    var setup: String?
    var punchline: String?
    
    enum CodingKeys: String, CodingKey {
        case setup = "setup"
        case punchline = "punchline"
    }
}

typealias Jokes = [Joke]
