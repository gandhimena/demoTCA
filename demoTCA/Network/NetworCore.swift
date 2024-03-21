//
//  NetworCore.swift
//  demoTCA
//
//  Created by gandhi mena on 9/3/24.
//

import Foundation

protocol RequestProtocol {
    var baseURL: String { get }
    var headers: [String: String] { get}
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParameters { get }
    var queryItems: [URLQueryItem]? { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum RequestParameters {
    case body(_ encodable: Encodable)
    case dict(_ dict: [String: Any])
    case none
}

extension RequestParameters {
    var data: Data? {
        switch self {
        case let .body(encodable):
            return try? JSONEncoder().encode(encodable)
        case let .dict(dictionary):
            return try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        case .none:
            return nil
        }
    }
}

struct NasaKeys {
    static var apiKey: String = "ykfl4DOF1UE4VF2JCzcHKOCIRcfClcm8MUN8bHVw"
}
