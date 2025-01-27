//
//  RecipeUseCaseTests.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import XCTest
@testable import ReceipeListKit

final class RecipeUseCaseTests: XCTestCase {
    
    final class MockRecipesRepository: RecipesRepositoryProtocol {
        var shouldThrowError = false
        var mockRecipes: [Recipe] = []

        func getRecipes() async throws -> [Recipe] {
            if shouldThrowError {
                throw NSError(domain: "MockError", code: 1, userInfo: nil)
            }
            return mockRecipes
        }
    }

    func test_getRecipes_success() async throws {
        let mockRepository = MockRecipesRepository()
        mockRepository.mockRecipes = [
            Recipe(cuisine: "Italian", name: "Pizza", photoUrlLarge: nil, photoUrlSmall: nil, id: "1", sourceUrl: nil, youtubeUrl: nil),
            Recipe(cuisine: "British", name: "Pie", photoUrlLarge: nil, photoUrlSmall: nil, id: "2", sourceUrl: nil, youtubeUrl: nil)
        ]
        let useCase = RecipeUseCase(repository: mockRepository)

        let recipes = try await useCase.getRecipes()

        XCTAssertEqual(recipes.count, 2)
        XCTAssertEqual(recipes.first?.name, "Pizza")
    }

    func test_getRecipes_failure() async throws {
        let mockRepository = MockRecipesRepository()
        mockRepository.shouldThrowError = true
        let useCase = RecipeUseCase(repository: mockRepository)

        
        do {
            _ = try await useCase.getRecipes()
            XCTFail("Expected an error, but no error was thrown.")
        } catch {
            // Verify the error type or message
            let nsError = error as NSError
            XCTAssertEqual(nsError.domain, "MockError")
        }
    }
    
    func test_getRecipes_emptyState() async throws {
        // Arrange
        let mockRepository = MockRecipesRepository()
        mockRepository.mockRecipes = [] // Simulate an empty state
        let useCase = RecipeUseCase(repository: mockRepository)

        // Act
        let recipes = try await useCase.getRecipes()

        // Assert
        XCTAssertTrue(recipes.isEmpty, "Expected no recipes, but received \(recipes.count).")
    }
}
