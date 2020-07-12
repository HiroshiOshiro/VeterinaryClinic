//
//  TopView.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/05.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct TopView: View {
    @ObservedObject var presenter: TopPresenter
        
    init(presenter: TopPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10.0) {

                HStack(spacing: 10.0) {
                    if presenter.parameter.config.isChatEnabled {
                        Button(action: {}) {
                            Text("topChat")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 60.0)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    if presenter.parameter.config.isCallEnabled {
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
                Text(NSLocalizedString("topOpeningHoursPrefix", comment: "") + presenter.parameter.config.workHours)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical, 15.0)
                    .border(Color.gray, width: 4)

                List {
                    ForEach(presenter.parameter.pets, id: \.id) { pet in
                        self.presenter.goToWebView(pet: pet) {
                            PetRow(pet: pet)
                        }
                    }
                }
            }
            .padding([.top, .leading, .trailing], 10.0)
        .navigationBarTitle("topTitle", displayMode: .inline)
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(presenter: TopPresenter(parameter: .init(pets: petData, config: configData)))
    }
}
