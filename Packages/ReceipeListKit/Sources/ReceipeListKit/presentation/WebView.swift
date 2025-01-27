//
//  WebView.swift
//  ReceipeListKit
//
//  Created by Matevos Ghazaryan on 1/26/25.
//

import SwiftUI
import WebKit

public struct WebView: UIViewRepresentable {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    public func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
