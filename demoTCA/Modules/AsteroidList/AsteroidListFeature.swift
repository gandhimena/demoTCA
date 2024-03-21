//
//  AsteroidListFeature.swift
//  demoTCA
//
//  Created by gandhi mena on 20/3/24.
//

import ComposableArchitecture

@Reducer
struct AsteroidListFeature {
    
    @Dependency(\.asteroidService) var asteroidService
    
    @ObservableState
    struct State: Equatable {
        var state: ViewState = .idle
        var asteridList: [NearEarthObject] = []
    }
    
    enum Action: Equatable {
        case getAsteroids
        case getAsteroidsResponse(Result<AsteroidsResponse, NetworkErrors>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .getAsteroids:
                return .run { send in
                    try await send(.getAsteroidsResponse(asteroidService.fetchAsteroids("2015-09-07", "2015-09-08")))
                }
            case let .getAsteroidsResponse(.success(response)):
                state.asteridList = response.nearEarthObjects.map { $0.1 }.flatMap { $0 }
                state.state = .success
                return .none
            case let .getAsteroidsResponse(.failure(error)):
                print(error.localizedDescription)
                state.state = .error
                return .none
            }
        }
    }
}
