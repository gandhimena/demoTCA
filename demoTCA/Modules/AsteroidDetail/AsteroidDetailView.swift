//
//  AsteroidDetailView.swift
//  demoTCA
//
//  Created by gandhi mena on 19/3/24.
//

import ComposableArchitecture
import SwiftUI

struct AsteroidDetailView: View {
    
    @Bindable var store: StoreOf<AsteroidDetailFeature>
    
    var body: some View {
        NavigationView {
            VStack {
                Text(store.asteroid.id)
                Text(store.asteroid.name)
            }
        }
    }
}

#Preview {
    NavigationView {
        AsteroidDetailView(store: Store(
            initialState: AsteroidDetailFeature.State(
                asteroid: NearEarthObject(
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
                    isSentryObject: true)), reducer: {
            AsteroidDetailFeature()
        }))
    }
}
