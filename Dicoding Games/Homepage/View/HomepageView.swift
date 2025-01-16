//
//  HomepageView.swift
//  Dicoding Games
//
//  Created by naswakhansa on 30/12/24.
//

import SwiftUI

struct HomepageView: View {
    @StateObject var viewModel: HomepageViewModel
    @State private var scrollToTopID: String = "scrollTop"
    
    init() {
        let container = AppContainer.shared
        _viewModel = StateObject(wrappedValue: container.resolve(HomepageViewModel.self))
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5).ignoresSafeArea(.all)
            switch viewModel.state {
            case .idle:
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack (spacing: 15) {
                            Text("")
                                .id(scrollToTopID)
                            
                            gameList
                            
                            buttonNextPrev
                            
                        }
                    }
                    .onChange(of: viewModel.scrollToTop) { newValue in
                        if newValue {
                            withAnimation {
                                scrollViewProxy.scrollTo(scrollToTopID, anchor: .top)
                                viewModel.scrollToTop.toggle()
                            }
                        }
                    }
                }
            case .loading:
                ProgressView()
            case .failed(let error):
                StateView(message: error) {
                    viewModel.fetchDataGames(url: nil)
                }
            }
        }
        .onAppear {
            viewModel.fetchDataGames(url: nil)
        }
        .toast(message: viewModel.toastMessage ?? "", show: viewModel.showToast)
        
    }
    
    private var buttonNextPrev: some View {
        HStack {
            if viewModel.prevLink != nil {
                Button(action: {
                    viewModel.fetchPrevData()
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                        .padding()
                }
            }
            
            Spacer()
            
            if viewModel.nextLink != nil {
                Button(action: {
                    viewModel.fetchNextData()
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.black)
                        .padding()
                }
            }
        }
        .padding()
    }
    
    private var gameList: some View {
        ForEach(viewModel.gamesListData) { game in
            NavigationLink(destination: {
                let detailViewModel = viewModel.getDetailViewModel(for: game.id)
                GameDetailView(viewModel: detailViewModel)
            }) {
                ItemGamesListView(
                    game: game,
                    isFavorite: .constant(game.isFavorite),
                    addToFavorites: {
                        viewModel.saveFavoriteGame(game: game)
                    }, removeFromFavorites: {
                        viewModel.deleteFavoriteGame(id: game.id)
                    }
                )
            }
        }
    }
}
