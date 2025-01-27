//
//  RecipesRepository.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//


public class RecipeRepository: RecipesRepositoryProtocol {
    private let dataSource: RecipeDataSourceProtocol
    
    public init(dataSource: RecipeDataSourceProtocol) {
        self.dataSource = dataSource
    }
    
    public func getRecipes() async throws -> [Recipe] {
        let receipesDTO = try await dataSource.getRecipes()
        return receipesDTO.recipes.map { $0.toRecipe() }
    }
}
