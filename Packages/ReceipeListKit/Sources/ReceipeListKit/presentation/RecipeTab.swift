//
//  RecipeTab.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

public enum RecipeTab: String, CaseIterable {
    case list = "List"
    case malformed = "Malformed"
    case empty = "Empty"

    var path: String {
        switch self {
        case .list:
            return APIConstants.listURL
        case .malformed:
            return APIConstants.malformedURL
        case .empty:
            return APIConstants.emptyURL
        }
    }
}
