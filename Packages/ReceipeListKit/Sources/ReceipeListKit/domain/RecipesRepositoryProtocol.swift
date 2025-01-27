//
//  RecipesRepositoryProtocol.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

public protocol RecipesRepositoryProtocol {
    func getRecipes() async throws -> [Recipe]
}
