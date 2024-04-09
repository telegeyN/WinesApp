//
//  Wine.swift
//  WinesApp
//
//  Created by Telegey Nurbekova on 09/04/24.
//

import Foundation

//Encodable - Swift to JSON (Javascript Object Notation)
//Decodable - JSON to Swift
//Codable - Encodable + Decodable

struct Wine: Decodable {
    let winery: String
    let wine: String
    let rating: Rating
    let location: String
    let image: String
    let id: Int
}

struct Rating: Decodable {
    let average: String
    let reviews: String
}
