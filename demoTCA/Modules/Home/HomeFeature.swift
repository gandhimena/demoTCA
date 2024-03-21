//
//  HomeFeature.swift
//  demoTCA
//
//  Created by gandhi mena on 9/3/24.
//

import ComposableArchitecture
import Dependencies

@Reducer
struct HomeFeature {
    
    @ObservableState
    struct State: Equatable {
        var asteroidListState = AsteroidListFeature.State()
    }
    
    enum Action: Equatable {
        case asteroidListAction(AsteroidListFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        
        Scope(state: \.asteroidListState, action: \.asteroidListAction) {
            AsteroidListFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .asteroidListAction:
                return .none
            }
        }
    }
}
