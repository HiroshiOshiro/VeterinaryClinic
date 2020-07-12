//
//  TopRouter.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/12.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct TopRouter {
    func makeWebView(url: URL) -> some View {
        let webView = WebView(url: url)
        return webView
    }
}

struct TopRouter_Previews: PreviewProvider {
    static var previews: some View {
        TopRouter().makeWebView(url: URL(string: "https://en.wikipedia.org/wiki/Cat")!)
    }
}
