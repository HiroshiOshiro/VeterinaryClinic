//
//  TopPresenter.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/12.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI
import Combine

final class TopPresenter: ObservableObject {
    private let router = TopRouter()
    
    enum Inputs {
        case didTapCallButton
        case didTapChatButton
        
    }
    
    func tapButton(inputs: Inputs) {
        switch inputs {
        case .didTapCallButton:
                print("call")
        case .didTapChatButton:
                print("chat")
        }
    }
    
    func goToWebView<Content: View>(pet: Pet, @ViewBuilder content: () -> Content) -> some View {
        let url = URL(string: pet.contentUrl)!
        return NavigationLink(destination: router.makeWebView(url: url)) {
            content()
        }
    }

}

