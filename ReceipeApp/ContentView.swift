//
//  ContentView.swift
//  ReceipeApp
//
//  Created by Matevos Ghazaryan on 1/25/25.
//

import SwiftUI
import ReceipeListKit

struct ContentView: View {
    @State private var isLoading: Bool = true

    var body: some View {
        if isLoading {
            // Splash Screen
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)

                Text("Loading...")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top, 16)

                ProgressView()
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.ignoresSafeArea())
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
        } else {
            NavigationView {
                URLSelectionView()
            }
        }
    }
}

#Preview {
    ContentView()
}
