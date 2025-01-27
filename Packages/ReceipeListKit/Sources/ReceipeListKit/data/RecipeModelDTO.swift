//
//  RecipeModel.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

public struct RecipeDTO: Decodable, Encodable {
    public let cuisine: String
    public let name: String
    public let photoUrlLarge: String?
    public let photoUrlSmall: String?
    public let uuid: String
    public let sourceUrl: String?
    public let youtubeUrl: String?
    
    enum CodingKeys: String, CodingKey {
            case cuisine
            case name
            case photoUrlLarge = "photo_url_large"
            case photoUrlSmall = "photo_url_small"
            case uuid
            case sourceUrl = "source_url"
            case youtubeUrl = "youtube_url"
        }
    
    public func toRecipe() -> Recipe {
        return Recipe(cuisine: cuisine, name: name, photoUrlLarge: photoUrlLarge, photoUrlSmall: photoUrlSmall, id: uuid, sourceUrl: sourceUrl, youtubeUrl: youtubeUrl)
    }
}

public struct RecipeResponseDTO: Decodable,Encodable {
    public let recipes: [RecipeDTO]
}
