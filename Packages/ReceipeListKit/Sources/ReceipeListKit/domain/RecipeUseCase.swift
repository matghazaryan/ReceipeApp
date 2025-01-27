//
//  RecipeUseCase.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//


import Foundation

public protocol RecipeUseCaseProtocol{
    func getRecipes() async throws -> [Recipe]
}

public final class RecipeUseCase: RecipeUseCaseProtocol {
    private let repository: RecipesRepositoryProtocol 
    
    public init(repository: RecipesRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getRecipes() async throws -> [Recipe] {
        return try await repository.getRecipes()
    }
}
