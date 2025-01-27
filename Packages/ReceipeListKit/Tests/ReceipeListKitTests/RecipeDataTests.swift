//
//  RecipeDataTests.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import XCTest
@testable import ReceipeListKit
import NetworkingKit

final class RecipeDataTests: XCTestCase {

    func test_recipeDTO_toRecipe() {
        let dto = RecipeDTO(
            cuisine: "Italian",
            name: "Pizza",
            photoUrlLarge: "https://example.com/large.jpg",
            photoUrlSmall: "https://example.com/small.jpg",
            uuid: "12345",
            sourceUrl: "https://example.com",
            youtubeUrl: "https://youtube.com"
        )

        let recipe = dto.toRecipe()

        XCTAssertEqual(recipe.cuisine, "Italian")
        XCTAssertEqual(recipe.name, "Pizza")
        XCTAssertEqual(recipe.photoUrlLarge, "https://example.com/large.jpg")
        XCTAssertEqual(recipe.photoUrlSmall, "https://example.com/small.jpg")
        XCTAssertEqual(recipe.id, "12345")
        XCTAssertEqual(recipe.sourceUrl, "https://example.com")
        XCTAssertEqual(recipe.youtubeUrl, "https://youtube.com")
    }

    func test_recipeDataSourceLocal_success() async throws {
        let dataSource = RecipeDataSourceLocal()

        let response = try await dataSource.getRecipes()

        XCTAssertEqual(response.recipes.count, 1)
        XCTAssertEqual(response.recipes.first?.name, "Bakewell Tart")
        XCTAssertEqual(response.recipes.first?.cuisine, "British")
    }

    func test_recipeDataSourceRemote_success() async throws {
        let mockAPIClient = MockAPIClient(response: RecipeResponseDTO(recipes: [
            RecipeDTO(
                cuisine: "French",
                name: "Crepes",
                photoUrlLarge: nil,
                photoUrlSmall: nil,
                uuid: "123",
                sourceUrl: nil,
                youtubeUrl: nil
            )
        ]))

        let dataSource = RecipeDataSourceRemote(apiClient: mockAPIClient)

        let response = try await dataSource.getRecipes()

        XCTAssertEqual(response.recipes.count, 1)
        XCTAssertEqual(response.recipes.first?.name, "Crepes")
        XCTAssertEqual(response.recipes.first?.cuisine, "French")
    }

    func test_recipeDataSourceRemote_malformedResponse() async throws {        
        let mockAPIClient = MockAPIClient(
            response: "Malformed Data",
            shouldThrowError: true,
            errorToThrow: DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Simulated decoding error"))
        )
        let dataSource = RecipeDataSourceRemote(apiClient: mockAPIClient)

        do {
            _ = try await dataSource.getRecipes()
            XCTFail("Expected a DecodingError to be thrown, but no error was thrown.")
        } catch {
            if error is DecodingError {
                XCTAssertTrue(true, "Correctly threw a DecodingError.")
            } else {
                XCTFail("Expected DecodingError but got \(error)")
            }
        }
    }

    func test_recipeDataSourceRemote_emptyResponse() async throws {
        let mockAPIClient = MockAPIClient(response: RecipeResponseDTO(recipes: []))

        let dataSource = RecipeDataSourceRemote(apiClient: mockAPIClient)

        let response = try await dataSource.getRecipes()

        XCTAssertTrue(response.recipes.isEmpty)
    }
}
