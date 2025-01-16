//
//  ListGamesResponseModel.swift
//  Dicoding Games
//
//  Created by naswakhansa on 30/12/24.
//


import Foundation

struct ListGamesResponseModel: Codable, Equatable {
    let count: Int
    let next: String?
    let previous: String?
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case games = "results"
    }
}

struct Game: Identifiable, Codable, Equatable {
    let id: Int
    let name: String?
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    var isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating, isFavorite
    }
    
    var formattedRating: String {
        if let rating = rating {
            return String(format: "%.1f", rating)
        }
        return "N/A"
    }

}
