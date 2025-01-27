//
//  MGAPIClient.swift
//  NetworkingKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//


import Foundation
import Combine


public struct MGAPIClient: APIClientProtocol {
    var baseURL: String
    var networkDispatcher: NetworkDispatcher

    public init(baseURL: String, networkDispatcher: NetworkDispatcher = NetworkDispatcher()) {
        self.baseURL = baseURL
        self.networkDispatcher = networkDispatcher
    }

    public func dispatch<T: Decodable>(_ request: any Request) async throws -> T {
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            throw NetworkRequestError.badRequest
        }

        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        // Validate HTTP response status code
        if let httpResponse = response as? HTTPURLResponse,
           !(200...299).contains(httpResponse.statusCode) {
            throw NetworkRequestError.invalidResponse(httpResponse.statusCode)
        }

        // Decode the response data
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}
