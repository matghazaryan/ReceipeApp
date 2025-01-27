//
//  RecipeViewModel.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import Foundation

public final class RecipeViewModel: ObservableObject {
    @Published public var recipes: [Recipe]?
    @Published public var isLoading: Bool = false

    private let useCase: RecipeUseCaseProtocol

    public init(useCase: RecipeUseCaseProtocol) {
        self.useCase = useCase
    }

    @MainActor func getRecipes() {
        Task {
            isLoading = true
            do {
                self.recipes = try await useCase.getRecipes()
            } catch {
                self.recipes = nil
                print("Errorrrr: \(error)")
            }
            isLoading = false // Set loading to false after fetching
        }
    }
}

extension RecipeViewModel {
    static var mock: RecipeViewModel {
        let mockUseCase = MockRecipeUseCase()
        let viewModel = RecipeViewModel(useCase: mockUseCase)
        viewModel.recipes = [
            Recipe(
                cuisine: "British",
                name: "Bakewell Tart",
                photoUrlLarge: "https://some.url/large.jpg",
                photoUrlSmall: "https://some.url/small.jpg",
                id: "1",
                sourceUrl: "https://some.url/index.html",
                youtubeUrl: "https://www.youtube.com/watch?v=some.id"
            ),
            Recipe(
                cuisine: "Italian",
                name: "Pizza Margherita",
                photoUrlLarge: "https://some.url/large2.jpg",
                photoUrlSmall: "https://some.url/small2.jpg",
                id: "2",
                sourceUrl: "https://some.url/index2.html",
                youtubeUrl: "https://www.youtube.com/watch?v=some.id2"
            )
        ]
        return viewModel
    }
}
