//
//  GameDetailUseCaseRemoteProtocol.swift
//  Dicoding Games
//
//  Created by naswakhansa on 15/01/25.
//

import Combine
import Foundation
import Alamofire


protocol GameDetailUseCaseRemoteProtocol {
    func fetchGameDetail(with id: Int) -> AnyPublisher<GameDetailResponseModel, AFError>
}

class GameDetailUseCaseRemote: GameDetailUseCaseRemoteProtocol {
    private let repository: GameDetailRepositoryRemoteProtocol
    
    init(repository: GameDetailRepositoryRemoteProtocol) {
        self.repository = repository
    }
    
    func fetchGameDetail(with id: Int) -> AnyPublisher<GameDetailResponseModel, AFError> {
        repository.fetchGameDetail(with: id)
    }
}
