//
//  AsteroidResponse.swift
//  demoTCA
//
//  Created by gandhi mena on 9/3/24.
//

import Foundation

// MARK: - Welcome
struct AsteroidsResponse: Codable, Equatable {
    let links: WelcomeLinks
    let elementCount: Int
    let nearEarthObjects: [String: [NearEarthObject]]

    enum CodingKeys: String, CodingKey {
        case links
        case elementCount = "element_count"
        case nearEarthObjects = "near_earth_objects"
    }
}

// MARK: - WelcomeLinks
struct WelcomeLinks: Codable, Equatable {
    let next, previous, linksSelf: String

    enum CodingKeys: String, CodingKey {
        case next, previous
        case linksSelf = "self"
    }
}

// MARK: - NearEarthObject
struct NearEarthObject: Codable, Identifiable, Equatable {
    let links: NearEarthObjectLinks
    let id, neoReferenceID, name: String
    let nasaJplURL: String
    let absoluteMagnitudeH: Double
    let estimatedDiameter: EstimatedDiameter
    let isPotentiallyHazardousAsteroid: Bool
    let closeApproachData: [CloseApproachDatum]
    let isSentryObject: Bool

    enum CodingKeys: String, CodingKey {
        case links, id
        case neoReferenceID = "neo_reference_id"
        case name
        case nasaJplURL = "nasa_jpl_url"
        case absoluteMagnitudeH = "absolute_magnitude_h"
        case estimatedDiameter = "estimated_diameter"
        case isPotentiallyHazardousAsteroid = "is_potentially_hazardous_asteroid"
        case closeApproachData = "close_approach_data"
        case isSentryObject = "is_sentry_object"
    }
}

// MARK: - CloseApproachDatum
struct CloseApproachDatum: Codable, Equatable {
    let closeApproachDate, closeApproachDateFull: String
    let epochDateCloseApproach: Int
    let relativeVelocity: RelativeVelocity
    let missDistance: MissDistance
    let orbitingBody: OrbitingBody

    enum CodingKeys: String, CodingKey {
        case closeApproachDate = "close_approach_date"
        case closeApproachDateFull = "close_approach_date_full"
        case epochDateCloseApproach = "epoch_date_close_approach"
        case relativeVelocity = "relative_velocity"
        case missDistance = "miss_distance"
        case orbitingBody = "orbiting_body"
    }
}

// MARK: - MissDistance
struct MissDistance: Codable, Equatable {
    let astronomical, lunar, kilometers, miles: String
}

enum OrbitingBody: String, Codable, Equatable {
    case earth = "Earth"
}

// MARK: - RelativeVelocity
struct RelativeVelocity: Codable, Equatable {
    let kilometersPerSecond, kilometersPerHour, milesPerHour: String

    enum CodingKeys: String, CodingKey {
        case kilometersPerSecond = "kilometers_per_second"
        case kilometersPerHour = "kilometers_per_hour"
        case milesPerHour = "miles_per_hour"
    }
}

// MARK: - EstimatedDiameter
struct EstimatedDiameter: Codable, Equatable {
    let kilometers, meters, miles, feet: Feet
}

// MARK: - Feet
struct Feet: Codable, Equatable {
    let estimatedDiameterMin, estimatedDiameterMax: Double

    enum CodingKeys: String, CodingKey {
        case estimatedDiameterMin = "estimated_diameter_min"
        case estimatedDiameterMax = "estimated_diameter_max"
    }
}

// MARK: - NearEarthObjectLinks
struct NearEarthObjectLinks: Codable, Equatable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}
