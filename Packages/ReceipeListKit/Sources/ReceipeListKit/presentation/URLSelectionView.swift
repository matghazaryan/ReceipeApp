//
//  URLSelectionView.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI

struct URLSelectionView: View {
    @AppStorage("selectedURL") private var selectedURL: String = APIConstants.listURL
    @State private var shouldNavigate: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            
            Text("Select Data Source")
                .font(.title)
                .padding()

            Button(action: {
                selectedURL = APIConstants.listURL
                shouldNavigate = true
            }) {
                Text("List")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }

            Button(action: {
                selectedURL = APIConstants.malformedURL
                shouldNavigate = true
            }) {
                Text("Malformed")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }

            Button(action: {
                selectedURL = APIConstants.emptyURL
                shouldNavigate = true
            }) {
                Text("Empty")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .navigationDestination(isPresented: $shouldNavigate) {
            let viewModel = RecipeDI.shared.recipeDependencies()
            RecipeListView(viewModel: viewModel)
        }
    }
}

#Preview {
    URLSelectionView()
}
