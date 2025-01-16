//
//  GameDetailResponseModel.swift
//  Dicoding Games
//
//  Created by naswakhansa on 30/12/24.
//

import Foundation

struct GameDetailResponseModel: Codable {
    let id: Int
    let name: String?
    let description: String?
    let metacritic: Int?
    let backgroundImage: String?
    let platforms: [Platforms]?
    let genres: [Developers]?
    let developers: [Developers]?
    let rating: Double?
    let released: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description = "description_raw"
        case metacritic
        case backgroundImage = "background_image"
        case platforms
        case genres
        case developers
        case rating
        case released
    }
    
    var formattedRating: String {
        if let rating = rating {
            return String(format: "%.1f", rating)
        }
        return "N/A"
    }
}

struct Developers: Codable {
    let id: Int
    let name: String
}

struct Platforms: Codable {
    let platform: PlatformDetail
}

struct PlatformDetail: Codable {
    let id: Int
    let name: String
}
