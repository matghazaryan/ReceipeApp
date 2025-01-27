//
//  MockAPIClient.swift
//  NetworkingKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import Foundation

public final class MockAPIClient: APIClientProtocol {
    private let response: Any
    private let shouldThrowError: Bool
    private let errorToThrow: Error? // New property to simulate specific errors

    public init(response: Any, shouldThrowError: Bool = false, errorToThrow: Error? = nil) {
        self.response = response
        self.shouldThrowError = shouldThrowError
        self.errorToThrow = errorToThrow
    }

    public func dispatch<T: Decodable>(_ request: any Request) async throws -> T {
        if shouldThrowError, let errorToThrow = errorToThrow {
            throw errorToThrow
        }

        if let response = response as? T {
            return response
        } else {
            // Simulate a decoding error if the response type doesn't match
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Simulated decoding error"))
        }
    }
}
