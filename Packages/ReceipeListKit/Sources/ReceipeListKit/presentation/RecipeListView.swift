//
//  RecipeView.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI
import DesignSystemKit

public struct RecipeListView: View {
    @StateObject var viewModel: RecipeViewModel

    public init(viewModel: RecipeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack {
            if viewModel.isLoading {
                CustomProgressView(message: "Loading recipes...", spinnerColor: .green)                
                    .padding()
            } else if let recipes = viewModel.recipes {
                if recipes.isEmpty {
                    EmptyStateView(message: "No recipes available!")
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(recipes, id: \.id) { recipe in
                                NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                                    RecipeCard(recipe: recipe)
                                }
                            }
                        }
                        .padding()
                    }
                }
            } else {
                ErrorStateView(message: "Something went wrong!")
            }
        }
        .task {
            viewModel.getRecipes()
        }
        .navigationTitle("Recipes") // Correct title will now appear
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeListView(viewModel: RecipeViewModel.mock)
}
