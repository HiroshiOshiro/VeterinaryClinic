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
                        ActionButton(text: Text("topChat"), backgroundColor: Color.blue, action: {self.presenter.tapButton(inputs: .didTapCallButton)})
                    }
                    if presenter.parameter.config.isCallEnabled {
                        ActionButton(text: Text("topCall"), backgroundColor: Color.green, action: {self.presenter.tapButton(inputs: .didTapCallButton)})
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
            .alert(isPresented: $presenter.isShowAlert, content: presenter.alertBuilder )
        }
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(presenter: TopPresenter(parameter: .init(pets: petData, config: configData)))
    }
}
