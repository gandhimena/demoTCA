//
//  Endpoints.swift
//  demoTCA
//
//  Created by gandhi mena on 9/3/24.
//

import Foundation

enum Endpoints {
    case asteroids(startDate: String, endDate: String)
    case asteroid(id: String)
    case marsRoverPhotos(cameraType: CameraType)
}

enum CameraType: String {
    case fhaz
    case rhaz
    case mast
    case chemcam
    case mahli
    case mardi
    case navcam
    case pancam
    case minites
}

extension Endpoints: RequestProtocol {
    var baseURL: String {
        switch self {
        case .asteroids:
            return "https://api.nasa.gov/neo/rest/v1/"
        case .asteroid:
            return "https://api.nasa.gov/neo/rest/v1/"
        case .marsRoverPhotos:
            return "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos"
        }
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .asteroids:
            return "feed"
        case let .asteroid( id):
            return "neo/\(id)"
        case .marsRoverPhotos:
            return ""
        }
        
    }
    
    var parameters: RequestParameters {
        return .none
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case let .asteroids(startDate, endDate):
            return [
                URLQueryItem(name: "start_date", value: startDate),
                URLQueryItem(name: "end_date", value: endDate),
                URLQueryItem(name: "api_key", value: NasaKeys.apiKey)
            ]
        case .asteroid:
            return [URLQueryItem(name: "api_key", value: NasaKeys.apiKey)]
        case let .marsRoverPhotos(cameraType):
            return [
                URLQueryItem(name: "sol", value: "1000"),
                URLQueryItem(name: "camera", value: cameraType.rawValue),
                URLQueryItem(name: "api_key", value: NasaKeys.apiKey)
            ]
        }
    }
}
