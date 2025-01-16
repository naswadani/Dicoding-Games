//
//  FavoritesUseCase.swift
//  Dicoding Games
//
//  Created by naswakhansa on 16/01/25.
//

import Foundation
import CoreData
import Combine

protocol FavoritesGameUseCaseProtocol {
    func fetchFavoriteGames(context: NSManagedObjectContext) -> AnyPublisher<[Game], Error>
    func deleteFavoriteGame(id: Int, context: NSManagedObjectContext) -> AnyPublisher<Bool, Error>
}

class FavoritesGameUseCase: FavoritesGameUseCaseProtocol {
    private let repository: FavoritesGameRepositoryProtocol
    
    init(repository: FavoritesGameRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchFavoriteGames(context: NSManagedObjectContext) -> AnyPublisher<[Game], Error> {
        return repository.fetchFavoriteGames(context: context)
            .map { favoriteEntities in
                favoriteEntities.map { entity in
                    Game(id: Int(entity.id),
                         name: entity.name,
                         released: entity.released,
                         backgroundImage: entity.backgroundImage,
                         rating: Double(entity.rating ?? "") ?? 0.0,
                         isFavorite: true)
                }
            }
            .eraseToAnyPublisher()
    }
    
    func deleteFavoriteGame(id: Int, context: NSManagedObjectContext) -> AnyPublisher<Bool, Error> {
        repository.deleteFavoriteGame(id: id, context: context)
    }
}
