//
//  RecipeDIContainer.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import Foundation
import NetworkingKit

public enum PHASE {
    case LOCAL, DEV, PROD
}

public class AppEnvironment {
    public init(){}
    public let phase: PHASE = .PROD
}

protocol RecipeDIInterface {
    func recipeDependencies() -> RecipeViewModel
}

public class RecipeDI: RecipeDIInterface {
    @MainActor public static let shared = RecipeDI(appEnvironment: AppEnvironment())
    
    private let appEnvironment: AppEnvironment
    
    private init(appEnvironment: AppEnvironment) {
        self.appEnvironment = appEnvironment
    }
    
    public func recipeDependencies() -> RecipeViewModel {
        let dataSource: RecipeDataSourceProtocol

        switch appEnvironment.phase {
        case .LOCAL:
            dataSource = RecipeDataSourceLocal()
        case .DEV:
            let apiClient = MGAPIClient(baseURL: APIConstants.baseURL)
            dataSource = RecipeDataSourceRemote(apiClient: apiClient)
        case .PROD:
            let apiClient = MGAPIClient(baseURL: APIConstants.baseURL)
            dataSource = RecipeDataSourceRemote(apiClient: apiClient)
        }
        
        let repository = RecipeRepository(dataSource: dataSource)

        let useCase = RecipeUseCase(repository: repository)

        let viewModel = RecipeViewModel(useCase: useCase)

        return viewModel
    }
}
