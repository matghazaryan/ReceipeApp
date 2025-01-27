//
//  MockRecipeUseCase.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

public final class MockRecipeUseCase: RecipeUseCaseProtocol {
    public func getRecipes() async throws -> [Recipe] {
        return []
    }
}
