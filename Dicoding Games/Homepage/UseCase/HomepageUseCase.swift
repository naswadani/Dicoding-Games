//
//  HomepageUseCaseRemote.swift
//  Dicoding Games
//
//  Created by naswakhansa on 15/01/25.
//

import Alamofire
import Combine
import CoreData

protocol HomepageUseCaseProtocol {
    func fetchHomepageData(url: String?) -> AnyPublisher<ListGamesResponseModel, AFError>
    func deleteFavoriteGame(id: Int, context: NSManagedObjectContext) -> AnyPublisher<Bool, Error>
    func saveFavoriteGame(game: Game, context: NSManagedObjectContext) -> AnyPublisher<Bool, Error>
}

class HomepageUseCase: HomepageUseCaseProtocol {
    
    private let repository: HomepageRepositoryProtocol
    
    init(repository: HomepageRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchHomepageData(url: String?) -> AnyPublisher<ListGamesResponseModel, AFError> {
        repository.fetchHomepageData(url: url)
    }
    
    func deleteFavoriteGame(id: Int, context: NSManagedObjectContext) -> AnyPublisher<Bool, Error> {
        repository.deleteFavoriteGame(id: id, context: context)
    }
    
    func saveFavoriteGame(game: Game, context: NSManagedObjectContext) -> AnyPublisher<Bool, Error> {
        repository.saveFavoriteGame(game: game, context: context)
    }
}
