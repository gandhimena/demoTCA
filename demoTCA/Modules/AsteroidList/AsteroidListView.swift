//
//  AsteroidListView.swift
//  demoTCA
//
//  Created by gandhi mena on 20/3/24.
//

import ComposableArchitecture
import SwiftUI

struct AsteroidListView: View {
    
    @Bindable var store: StoreOf<AsteroidListFeature>
    
    var body: some View {
        List(store.asteridList) { asteroid in
            NavigationLink(destination: AsteroidDetailView(store: Store(initialState: AsteroidDetailFeature.State(asteroid: asteroid), reducer: {
                AsteroidDetailFeature()
            }))) {
                Text(asteroid.name)
            }
        }
        .onAppear {
            store.send(.getAsteroids)
        }
    }
}

#Preview {
    NavigationView {
        AsteroidListView(store: Store(
            initialState: AsteroidListFeature.State(asteridList: [.itemMock]),
            reducer: { AsteroidListFeature() }))
    }
}

fileprivate extension NearEarthObject {
    static var itemMock: NearEarthObject {
        NearEarthObject(
            links: NearEarthObjectLinks(linksSelf: ""),
            id: "1",
            neoReferenceID: "1",
            name: "(2010 PK9)",
            nasaJplURL: "nasaJplURL",
            absoluteMagnitudeH: 2,
            estimatedDiameter: EstimatedDiameter(
                kilometers: Feet(estimatedDiameterMin: 10, estimatedDiameterMax: 10),
                meters: Feet(estimatedDiameterMin: 10, estimatedDiameterMax: 10),
                miles: Feet(estimatedDiameterMin: 10, estimatedDiameterMax: 10),
                feet: Feet(estimatedDiameterMin: 10, estimatedDiameterMax: 10)),
            isPotentiallyHazardousAsteroid: true,
            closeApproachData: [CloseApproachDatum(
                closeApproachDate: "closeApproachDate",
                closeApproachDateFull: "closeApproachDate",
                epochDateCloseApproach: 1,
                relativeVelocity: RelativeVelocity(
                    kilometersPerSecond: "kilometersPerSecond",
                    kilometersPerHour: "kilometersPerHour",
                    milesPerHour: "milesPerHour"),
                missDistance: MissDistance(
                    astronomical: "astronomical",
                    lunar: "lunar",
                    kilometers: "kilometers",
                    miles: "miles"),
                orbitingBody: .earth)],
            isSentryObject: true)
    }
}
