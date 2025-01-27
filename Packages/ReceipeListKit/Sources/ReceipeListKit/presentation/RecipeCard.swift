//
//  RecipeCard.swift
//  DesignSystemKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI

public struct RecipeCard: View {
    public let recipe: Recipe

    public init(recipe: Recipe) {
        self.recipe = recipe
    }

    public var body: some View {
        HStack {
            AsyncImage(url: URL(string: recipe.photoUrlSmall ?? "")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 8) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}
