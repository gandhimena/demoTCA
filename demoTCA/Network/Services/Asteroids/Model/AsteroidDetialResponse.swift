//
//  AsteroidDetialResponse.swift
//  demoTCA
//
//  Created by gandhi mena on 18/3/24.
//

import Foundation

// MARK: - AsteroidDetailResponse
struct AsteroidDetialResponse: Codable, Equatable {
    let links: Links
    let id, neoReferenceID, name, designation: String
    let nasaJplURL: String
    let absoluteMagnitudeH: Double
    let estimatedDiameter: EstimatedDiameter
    let isPotentiallyHazardousAsteroid: Bool
    let closeApproachData: [CloseApproachDatum]
    let orbitalData: OrbitalData
    let isSentryObject: Bool

    enum CodingKeys: String, CodingKey {
        case links, id
        case neoReferenceID = "neo_reference_id"
        case name, designation
        case nasaJplURL = "nasa_jpl_url"
        case absoluteMagnitudeH = "absolute_magnitude_h"
        case estimatedDiameter = "estimated_diameter"
        case isPotentiallyHazardousAsteroid = "is_potentially_hazardous_asteroid"
        case closeApproachData = "close_approach_data"
        case orbitalData = "orbital_data"
        case isSentryObject = "is_sentry_object"
    }
}

// MARK: - Links
struct Links: Codable, Equatable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - OrbitalData
struct OrbitalData: Codable, Equatable {
    let orbitID, orbitDeterminationDate, firstObservationDate, lastObservationDate: String
    let dataArcInDays, observationsUsed: Int
    let orbitUncertainty, minimumOrbitIntersection, jupiterTisserandInvariant, epochOsculation: String
    let eccentricity, semiMajorAxis, inclination, ascendingNodeLongitude: String
    let orbitalPeriod, perihelionDistance, perihelionArgument, aphelionDistance: String
    let perihelionTime, meanAnomaly, meanMotion, equinox: String
    let orbitClass: OrbitClass

    enum CodingKeys: String, CodingKey {
        case orbitID = "orbit_id"
        case orbitDeterminationDate = "orbit_determination_date"
        case firstObservationDate = "first_observation_date"
        case lastObservationDate = "last_observation_date"
        case dataArcInDays = "data_arc_in_days"
        case observationsUsed = "observations_used"
        case orbitUncertainty = "orbit_uncertainty"
        case minimumOrbitIntersection = "minimum_orbit_intersection"
        case jupiterTisserandInvariant = "jupiter_tisserand_invariant"
        case epochOsculation = "epoch_osculation"
        case eccentricity
        case semiMajorAxis = "semi_major_axis"
        case inclination
        case ascendingNodeLongitude = "ascending_node_longitude"
        case orbitalPeriod = "orbital_period"
        case perihelionDistance = "perihelion_distance"
        case perihelionArgument = "perihelion_argument"
        case aphelionDistance = "aphelion_distance"
        case perihelionTime = "perihelion_time"
        case meanAnomaly = "mean_anomaly"
        case meanMotion = "mean_motion"
        case equinox
        case orbitClass = "orbit_class"
    }
}

// MARK: - OrbitClass
struct OrbitClass: Codable, Equatable {
    let orbitClassType, orbitClassDescription, orbitClassRange: String

    enum CodingKeys: String, CodingKey {
        case orbitClassType = "orbit_class_type"
        case orbitClassDescription = "orbit_class_description"
        case orbitClassRange = "orbit_class_range"
    }
}
