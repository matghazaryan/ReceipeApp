//
//  DataSource.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import NetworkingKit
import Foundation

public protocol RecipeDataSourceProtocol {
    func getRecipes() async throws -> RecipeResponseDTO
}

public final class RecipeDataSourceLocal: RecipeDataSourceProtocol {
    public init() {}
    
    public func getRecipes() async throws -> RecipeResponseDTO {
        let jsonData = try JSONSerialization.data(withJSONObject: recipLocalData, options: .prettyPrinted)
        let decodedResponse = try JSONDecoder().decode(RecipeResponseDTO.self, from: jsonData) // Decoding an array
        return decodedResponse
    }
}


public final class RecipeDataSourceRemote: RecipeDataSourceProtocol {
    var apiClient: APIClientProtocol

    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    public func getRecipes() async throws -> RecipeResponseDTO {
        return try await apiClient.dispatch(RecipeRequest())
    }
}
