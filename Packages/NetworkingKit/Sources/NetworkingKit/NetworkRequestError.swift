//
//  NetworkRequestError.swift
//  NetworkingKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import Foundation

public enum NetworkRequestError: LocalizedError, Equatable {
    case invalidRequest
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError
    case urlSessionFailed(_ error: URLError)
    case unknownError
    case invalidResponse(Int)
}
