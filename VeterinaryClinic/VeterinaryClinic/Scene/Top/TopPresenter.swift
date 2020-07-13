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
    @Published var isShowAlert = false
    
    // data source
    struct Parameter {
        let pets: [Pet]
        let config: Config
    }
    // input from view
    enum Inputs {
        case didTapCallButton
        case didTapChatButton
    }
    
    private let router = TopRouter()
    let parameter: Parameter
    
    init(parameter: Parameter) {
        self.parameter = parameter
    }
    
    func tapButton(inputs: Inputs) -> Void {
        switch inputs {
        case .didTapCallButton:
            print("call")
            isShowAlert = true
        case .didTapChatButton:
            print("chat")
            isShowAlert = true
        }
    }
    
    private func isWorkingHour() -> Bool {
        let now = Date()
        
        let comp = Calendar.Component.weekday
        let weekdate = NSCalendar.current.component(comp, from: now)
        
        if case 2...6 = weekdate {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "HH:mm"
            dateformatter.locale = .current
            let currentTime = dateformatter.string(from: now)
            
            // separate string by " " to get start hour and end hour
            let workingHourParts = parameter.config.workHours.components(separatedBy: " ")
            
            let dateWithStartTime = dateformatter.date(from: workingHourParts[1])!
            let dateWithEndTime = dateformatter.date(from: workingHourParts[3])!
            let dateWithCurrentTIme = dateformatter.date(from: currentTime)!
            
            if dateWithStartTime <= dateWithCurrentTIme,
                dateWithCurrentTIme <= dateWithEndTime {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func alertBuilder() -> Alert {
        let alertButton = Alert.Button.default(Text("OK")) {
            print("did tap alert OK button")
        }
        if isWorkingHour() {
            return Alert(title: Text(""), message: Text("alertMessageThankYou"), dismissButton: alertButton)
        } else {
            return Alert(title: Text(""), message: Text("alertMessageOutOfBH"), dismissButton: alertButton)
        }
    }
    
    func goToWebView<Content: View>(pet: Pet, @ViewBuilder content: () -> Content) -> some View {
        let url = URL(string: pet.contentUrl)!
        return NavigationLink(destination: router.makeWebView(url: url)) {
            content()
        }
    }
}

