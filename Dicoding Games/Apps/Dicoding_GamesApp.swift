//
//  Dicoding_GamesApp.swift
//  Dicoding Games
//
//  Created by naswakhansa on 30/12/24.
//

import SwiftUI
import CoreData

@main
struct Dicoding_GamesApp: App {
    let container = AppContainer.shared
    var body: some Scene {
        WindowGroup {
            TabBarCustomView()
                .environment(\.managedObjectContext, container.resolve(NSManagedObjectContext.self))

        }
    }
}
