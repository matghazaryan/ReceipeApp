//
//  CustomProgressView.swift
//  DesignSystemKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI

public struct CustomProgressView: View {
    public var message: String
    public var spinnerColor: Color

    public init(message: String, spinnerColor: Color = .primary) {
        self.message = message
        self.spinnerColor = spinnerColor
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            // Circular Spinner
            Circle()
                .trim(from: 0.0, to: 0.7)
                .stroke(spinnerColor, lineWidth: 6)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(360))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: UUID())
            
            // Loading Message
            Text(message)
                .font(.headline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(UIColor.systemBackground))
                .shadow(radius: 8)
        )
    }
}
