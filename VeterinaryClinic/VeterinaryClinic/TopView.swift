//
//  TopView.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/05.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct TopView: View {
    private var config: Config
    
    init(configData: Config) {
        config = configData
    }
    
    var body: some View {
        VStack(spacing: 10.0) {
            HStack(spacing: 10.0) {
                if config.isChatEnabled {
                    Button(action: {}) {
                        Text(NSLocalizedString("topChat", comment: ""))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 60.0)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                if config.isCallEnabled {
                    Button(action: {}) {
                        Text(NSLocalizedString("topCall", comment: ""))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 60.0)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            Text(NSLocalizedString("topOpeningHoursPrefix", comment: "") + config.workHours)
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
        TopView(configData: configData)
    }
}
