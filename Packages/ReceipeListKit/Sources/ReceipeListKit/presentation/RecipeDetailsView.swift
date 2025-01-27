//
//  SwiftUIView.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI

import WebKit

public struct RecipeDetailsView: View {
    let recipe: Recipe

    public init(recipe: Recipe) {
        self.recipe = recipe
    }

    public var body: some View {
        VStack(spacing: 16) {
            // Large Photo
            if let photoUrl = recipe.photoUrlLarge, let url = URL(string: photoUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(12)
                } placeholder: {
                    Color.gray
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(12)
                }
            }

            // Cuisine
            Text("Cuisine: \(recipe.cuisine)")
                .font(.title2)
                .padding()

            // Website Button
            if let sourceUrl = recipe.sourceUrl, let url = URL(string: sourceUrl) {
                NavigationLink {
                    WebView(url: url)
                } label: {
                    Text("View Website")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }

            // YouTube Button
            if let youtubeUrl = recipe.youtubeUrl, let url = URL(string: youtubeUrl) {
                NavigationLink {
                    WebView(url: url)
                } label: {
                    Text("Watch on YouTube")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .padding()
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RecipeDetailsView(recipe: Recipe(
        cuisine: "British",
        name: "Bakewell Tart",
        photoUrlLarge: "https://some.url/large.jpg",
        photoUrlSmall: "https://some.url/small.jpg",
        id: "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
        sourceUrl: "https://some.url/index.html",
        youtubeUrl: "https://www.youtube.com/watch?v=some.id"
    ))
}
