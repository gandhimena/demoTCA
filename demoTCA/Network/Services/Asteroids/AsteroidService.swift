//
//  AsteroidService.swift
//  demoTCA
//
//  Created by gandhi mena on 18/3/24.
//

import Foundation
import Dependencies

struct AsteroidService {
    var fetchAsteroids: (_ startDate: String, _ endDate: String) async throws -> Result<AsteroidsResponse, NetworkErrors>
    var getAsteroid: (_ id: String) async throws -> Result<AsteroidDetialResponse, NetworkErrors>
}

extension AsteroidService: DependencyKey {
    static let liveValue = Self(
        fetchAsteroids: { startDate, endDate in
            return await ApiClient().request(.asteroids(startDate: startDate, endDate: endDate))
        }, getAsteroid: { id in
            return await ApiClient().request(.asteroid(id: id))
        })
    
    static let testValue = Self(
        fetchAsteroids: { startDate, endDate in
            return await ApiClient().request(.asteroids(startDate: startDate, endDate: endDate))
        }, getAsteroid: { id in
            return await ApiClient().request(.asteroid(id: id))
        })
}

extension DependencyValues {
    var asteroidService: AsteroidService {
        get { self[AsteroidService.self] }
        set { self[AsteroidService.self] = newValue }
    }
}
