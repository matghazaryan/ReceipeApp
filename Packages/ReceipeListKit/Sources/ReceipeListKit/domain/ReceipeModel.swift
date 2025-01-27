//
//  Receipe.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/25/25.
//

public struct Recipe: Sendable {
    public let cuisine: String
    public let name: String
    public let photoUrlLarge: String?
    public let photoUrlSmall: String?
    public let id: String
    public let sourceUrl: String?
    public let youtubeUrl: String?

    public init(
        cuisine: String,
        name: String,
        photoUrlLarge: String?,
        photoUrlSmall: String?,
        id: String,
        sourceUrl: String?,
        youtubeUrl: String?
    ) {
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.id = id
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
    }
}
