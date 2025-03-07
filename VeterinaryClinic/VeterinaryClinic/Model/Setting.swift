//
//  Setting.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/12.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import Foundation
import SwiftUI

struct Config: Codable {
    var isChatEnabled: Bool
    var isCallEnabled: Bool
    var workHours: String
}

let settingData: Config = loadConfig("config.json")

func loadConfig<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
