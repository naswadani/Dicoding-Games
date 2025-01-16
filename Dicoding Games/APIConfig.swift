//
//  APIConfig.swift
//  Dicoding Games
//
//  Created by naswakhansa on 30/12/24.
//


import Foundation

protocol APIConfigProtocol {
    func endpoint(for path: String) -> String
    func gameDetail(for gameId: Int) -> String 
}

final class APIConfig: APIConfigProtocol {
    let baseURL: String = "https://api.rawg.io/api"
    let keyAPI: String = "f37cf8ff79df40fb86119195611f72ac"
    
    func endpoint(for path: String) -> String {
        return "\(baseURL)\(path)\(keyAPI)"
    }
    
    func gameDetail(for gameId: Int) -> String {
        return "\(baseURL)/games/\(gameId)?key=\(keyAPI)"
    }
}
