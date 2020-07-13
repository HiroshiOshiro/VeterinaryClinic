//
//  ActionButton.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/13.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    var text: Text
    var backgroundColor: Color
    var action: () -> Void
    
    
    var body: some View {
        Button(action: action) {
            text
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 60.0)
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(text: Text("Button"), backgroundColor: Color.blue, action: {})
    }
}
