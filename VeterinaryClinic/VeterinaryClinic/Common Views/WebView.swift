//
//  WebView.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/12.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: url))
    }
}
