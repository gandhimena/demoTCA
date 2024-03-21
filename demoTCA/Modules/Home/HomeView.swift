//
//  HomeView.swift
//  demoTCA
//
//  Created by gandhi mena on 9/3/24.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
    
    @Bindable var store: StoreOf<HomeFeature>
    
    var body: some View {
        NavigationView {
            GeometryReader { g in
                ScrollView {
                    AsteroidListView(store: store.scope(state: \.asteroidListState, action: \.asteroidListAction))
                    .frame(width: g.size.width, height: g.size.height)
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    NavigationView {
        HomeView(store: Store(initialState: HomeFeature.State(), reducer: {
            HomeFeature()
        }))
    }
}
