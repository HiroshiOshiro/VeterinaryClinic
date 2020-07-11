//
//  TopView.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/05.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack(spacing: 10.0) {
            HStack(spacing: 10.0) {
                Button(action: {}) {
                    Text("Chat")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 60.0)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {}) {
                    Text("Call")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 60.0)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Text("Opening Hours: XXX")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 15.0)
                .border(Color.gray, width: 4)
            List(petData) { pet in
                PetRow(pet: pet)
            }
        }.padding(.horizontal, 10.0)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
