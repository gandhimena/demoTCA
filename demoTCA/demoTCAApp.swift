//
//  demoTCAApp.swift
//  demoTCA
//
//  Created by gandhi mena on 9/3/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct demoTCAApp: App {
    
    static let initStore = Store(initialState: HomeFeature.State()) {
        HomeFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView(store: demoTCAApp.initStore)
        }
    }
}
