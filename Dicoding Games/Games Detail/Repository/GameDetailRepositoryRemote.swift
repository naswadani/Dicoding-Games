//
//  GameDetailRepositoryRemote.swift
//  Dicoding Games
//
//  Created by naswakhansa on 31/12/24.
//

import Alamofire
import Foundation
import Combine

protocol GameDetailRepositoryRemoteProtocol {
    func fetchGameDetail(with id: Int) -> AnyPublisher<GameDetailResponseModel, AFError>
}

class GameDetailRepositoryRemote: GameDetailRepositoryRemoteProtocol {
    let dataSource: GameDetailDataSourceRemoteProtocol
    
    init(dataSource: GameDetailDataSourceRemoteProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchGameDetail(with id: Int) -> AnyPublisher<GameDetailResponseModel, AFError> {
        dataSource.fetchGameDetail(with: id)
    }
}