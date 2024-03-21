//
//  ApiClient.swift
//  demoTCA
//
//  Created by gandhi mena on 9/3/24.
//

import Foundation

struct ApiClient {
    func request<T: Codable>(_ endpoint: Endpoints) async -> Result<T, NetworkErrors> where T: Codable {
        await urlSessionRequest(getURLRequest(endpoint: endpoint))
    }
    
    private func urlSessionRequest<T: Decodable>(_ urlRequest: URLRequest) async -> Result<T, NetworkErrors> {
        guard let (data, _) = try? await URLSession.shared.data(for: urlRequest) else { return .failure(.serverError) }
        guard let decodable = try? JSONDecoder().decode(T.self, from: data) else { return .failure(.serverError) }
        return .success(decodable)
    }
    
    private func getURLRequest(endpoint: Endpoints) async -> URLRequest {
        let url = URL(string: endpoint.baseURL + endpoint.path) ?? URL(string: "urlFial")!
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true) ?? URLComponents()
        urlComponent.queryItems = endpoint.queryItems
        var urlRequest = URLRequest(url: urlComponent.url ?? URL(string: "urlFial")!)
        endpoint.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.httpBody = endpoint.parameters.data
        print(urlRequest.url?.absoluteString ?? "")
        return urlRequest
    }
}


enum NetworkErrors: Error {
    case serverError
}

