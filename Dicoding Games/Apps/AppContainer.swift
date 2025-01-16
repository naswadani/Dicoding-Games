//
//  AppContainer.swift
//  Dicoding Games
//
//  Created by naswakhansa on 15/01/25.
//

import Swinject
import CoreData

class AppContainer {
    static let shared = AppContainer()
    let container: Container
    
    private init() {
        container = Container()
        container.register(APIConfigProtocol.self) {_ in
            APIConfig()
        }
        registerHomepageDependencies()
        registerDetailDependency()
        registerFavoriteDependency()
    }
    
    func registerHomepageDependencies() {
        container.register(HomepageDataSourceProtocol.self) { resolver in
            guard let apiConfig = resolver.resolve(APIConfigProtocol.self),
                  let context = resolver.resolve(NSManagedObjectContext.self)
            else {
                fatalError("Failed to resolve APIConfigProtocol")
            }
            return HomepageDataSource(apiConfig: apiConfig, context: context)
        }
        
        container.register(HomepageRepositoryProtocol.self) { resolver in
            guard let dataSource = resolver.resolve(HomepageDataSourceProtocol.self) else {
                fatalError("Failed to resolve HomepageDataSourceProtocol")
            }
            return HomepageRepository(dataSource: dataSource)
        }
        
        container.register(HomepageUseCaseProtocol.self) { resolver in
            guard let repository = resolver.resolve(HomepageRepositoryProtocol.self) else {
                fatalError("Failed to resolve HomepageRepositoryProtocol")
            }
            return HomepageUseCase(repository: repository)
        }
        
        container.register(NSManagedObjectContext.self) { _ in
            PersistenceController.shared.context
        }
        
        container.register(HomepageViewModel.self) { resolver in
            guard
                let usecase = resolver.resolve(HomepageUseCaseProtocol.self),
                let context = resolver.resolve(NSManagedObjectContext.self)
            else {
                fatalError("Failed to resolve dependencies for HomepageViewModel")
            }
            return HomepageViewModel(usecase: usecase, context: context)
        }
    }
    
    func registerDetailDependency() {
        container.register(GameDetailDataSourceRemoteProtocol.self) { resolver in
            guard let apiConfig = resolver.resolve(APIConfigProtocol.self) else {
                fatalError("Failed to resolve APIConfigProtocol")
            }
            return GameDetailDataSourceRemote(apiConfig: apiConfig)
        }
        
        container.register(GameDetailRepositoryRemoteProtocol.self) { resolver in
            guard let dataSource = resolver.resolve(GameDetailDataSourceRemoteProtocol.self) else {
                fatalError("Failed to resolve GameDetailDataSourceRemoteProtocol")
            }
            return GameDetailRepositoryRemote(dataSource: dataSource)
        }
        
        container.register(GameDetailUseCaseRemoteProtocol.self) { resolver in
            guard let repository = resolver.resolve(GameDetailRepositoryRemoteProtocol.self) else {
                fatalError("Failed to resolve GameDetailRepositoryRemoteProtocol")
            }
            return GameDetailUseCaseRemote(repository: repository)
        }
        
        container.register(GameDetailViewModel.self) { (resolver, selectedGameId: Int) in
            guard
                let usecase = resolver.resolve(GameDetailUseCaseRemoteProtocol.self)
            else {
                fatalError("Failed to resolve dependencies for GameDetailViewModel")
            }
            return GameDetailViewModel(usecase: usecase, selectedGameId: selectedGameId)
        }
    }
    
    func registerFavoriteDependency() {
        container.register(FavoritesGameDataSourceProtocol.self) { resolver in
            return FavoritesGameDataSource()
        }
        
        container.register(FavoritesGameRepositoryProtocol.self) { resolver in
            guard let dataSource = resolver.resolve(FavoritesGameDataSourceProtocol.self) else {
                fatalError("Failed to resolve FavoritesRepositoryProtocol")
            }
            return FavoritesGameRepository(dataSource: dataSource)
        }
        
        container.register(FavoritesGameUseCaseProtocol.self) { resolver in
            guard let repository = resolver.resolve(FavoritesGameRepositoryProtocol.self) else {
                fatalError("Failed to resolve FavoritesUseCaseProtocol")
            }
            return FavoritesGameUseCase(repository: repository)
        }
        
        container.register(FavoriteGameViewModel.self) { resolver in
            guard
                let usecase = resolver.resolve(FavoritesGameUseCaseProtocol.self),
                let context = resolver.resolve(NSManagedObjectContext.self)
            else {
                fatalError("Failed to resolve dependencies for FavoriteGameViewModel")
            }
            return FavoriteGameViewModel(usecase: usecase, context: context)
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        guard let service = container.resolve(type) else {
            fatalError("Dependency \(type) could not be resolved.")
        }
        return service
    }
}

