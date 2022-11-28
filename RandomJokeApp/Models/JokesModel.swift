//
//  JokesModel.swift
//  JokesApp
//
//  Created by jian.mikee.pacheco on 11/25/22.
//

import Foundation

// JokesModel: must be decodable to decode the JSON file from the API
struct Joke: Decodable {
    let id: Int
    let setup: String
    let punchline: String
}

typealias Jokes = [Joke]
