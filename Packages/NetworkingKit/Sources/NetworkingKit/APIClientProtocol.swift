//
//  APIClientProtocol.swift
//  NetworkingKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import Foundation

public protocol APIClientProtocol {
    func dispatch<T: Decodable>(_ request: any Request) async throws -> T
}
