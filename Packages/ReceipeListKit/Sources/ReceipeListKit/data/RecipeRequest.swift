//
//  RecipeRequest.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import NetworkingKit
import SwiftUI

public struct RecipeRequest: Request {
    public var contentType: String?
    public var body: [String: Any]?
    public var headers: [String: String]?
    public typealias ReturnType = RecipeResponseDTO

    @AppStorage("selectedURL") private var selectedURL: String = APIConstants.listURL
    public var path: String { selectedURL } 
    public var method: HTTPMethod = .get

    public init(body: [String: Any]? = nil) {
        self.body = body
    }
}
