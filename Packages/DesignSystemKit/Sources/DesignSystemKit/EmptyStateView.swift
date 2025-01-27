//
//  EmptyStateView.swift
//  DesignSystemKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI

public struct EmptyStateView: View {
    public let message: String

    public init(message: String) {
        self.message = message
    }

    public var body: some View {
        VStack {
            Text("🤷‍♂️")
                .font(.largeTitle)
            Text(message)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}
