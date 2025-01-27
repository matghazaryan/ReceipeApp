//
//  URLSelectionView.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI
import ReceipeListKit
import Network

struct URLSelectionView: View {
    @AppStorage("selectedURL") private var selectedURL: String = APIConstants.listURL
    @State private var shouldNavigate: Bool = false
    @State private var showNoInternetAlert: Bool = false // State for showing alert

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Select Data Source")
                    .font(.title)
                    .padding()

                Button(action: {
                    checkInternetAndProceed {
                        selectedURL = APIConstants.listURL
                        shouldNavigate = true
                    }
                }) {
                    Text("List")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                Button(action: {
                    checkInternetAndProceed {
                        selectedURL = APIConstants.malformedURL
                        shouldNavigate = true
                    }
                }) {
                    Text("Malformed")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                Button(action: {
                    checkInternetAndProceed {
                        selectedURL = APIConstants.emptyURL
                        shouldNavigate = true
                    }
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
            .alert("No Internet Connection", isPresented: $showNoInternetAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please check your connection and try again.")
            }
        }
    }

    private func checkInternetAndProceed(action: @escaping () -> Void) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    action() // Proceed if there's internet
                } else {
                    showNoInternetAlert = true // Show alert if no connection
                }
                monitor.cancel() // Stop monitoring after the check
            }
        }
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.start(queue: queue)
    }
}

#Preview {
    URLSelectionView()
}
