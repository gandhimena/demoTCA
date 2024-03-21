//
//  AsteroidListTests.swift
//  demoTCATests
//
//  Created by gandhi mena on 20/3/24.
//

import ComposableArchitecture
import XCTest
@testable import demoTCA

@MainActor
final class AsteroidListTests: XCTestCase {
    
    func test_fetchAsteroidList() async {
        let store = TestStore(initialState: AsteroidListFeature.State()) {
            AsteroidListFeature()
        } withDependencies: {
            $0.asteroidService.fetchAsteroids = { startDate, endDate in
                .success(self.asteroidResponse)
            }
        }
        
        await store.send(.getAsteroids)
        await store.receive(.getAsteroidsResponse(.success(self.asteroidResponse))) 
        {
            $0.asteridList = [self.item]
            $0.state = .success
        }
    }
}

extension AsteroidListTests {
    var item: NearEarthObject {
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
    
    var asteroids: IdentifiedArrayOf<NearEarthObject> {
        IdentifiedArrayOf(repeating: item, count: 1)
    }
    
    var asteroidResponse: AsteroidsResponse {
        AsteroidsResponse(links: WelcomeLinks(next: "2", previous: "1", linksSelf: ""), elementCount: asteroids.count, nearEarthObjects: ["asteroids": asteroids.elements])
    }
}

