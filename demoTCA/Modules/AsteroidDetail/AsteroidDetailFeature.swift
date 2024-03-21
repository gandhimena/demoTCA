//
//  AsteroidDetailFeature.swift
//  demoTCA
//
//  Created by gandhi mena on 19/3/24.
//

import ComposableArchitecture

@Reducer
struct AsteroidDetailFeature {
    
    @Dependency(\.asteroidService) var asteroidService
    
    @ObservableState
    struct State: Equatable {
        var asteroid: NearEarthObject
    }
    
    enum Action: Equatable {
        case none
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .none:
                return .none
            }
        }
    }
}
