//
//  FavoriteGameStateManager.swift
//  Dicoding Games
//
//  Created by naswakhansa on 16/01/25.
//

import Foundation
import Combine

class FavoriteGameStateManager {
    static let shared = FavoriteGameStateManager()
    
    let favoriteGameStatePublisher = PassthroughSubject<(Int, Bool), Never>()
    
    private init() {}
}
