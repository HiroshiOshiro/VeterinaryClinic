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
    @ObservedObject var presenter: TopPresenter
    
    init(configData: Config, presenter: TopPresenter) {
        config = configData
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10.0) {

                HStack(spacing: 10.0) {
                    if config.isChatEnabled {
                        Button(action: {}) {
                            Text("topChat")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 60.0)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    if config.isCallEnabled {
                        Button(action: {}) {
                            Text("topCall")
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
                    self.presenter.goToWebView(pet: pet) {
                        PetRow(pet: pet)
                    }
                }
            }
        .padding(.horizontal, 10.0)
        .navigationBarTitle("topTitle", displayMode: .inline)
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(configData: configData, presenter: TopPresenter())
    }
}
