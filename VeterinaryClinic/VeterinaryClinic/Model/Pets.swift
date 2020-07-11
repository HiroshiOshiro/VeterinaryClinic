//
//  Pets.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/05.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct Pet: Hashable, Codable, Identifiable {
    let id = UUID()
    var imageUrl: String
    var title: String
    var contentUrl: String
    var dateAdded: Date
    
}

extension Pet {
    var image: ImageFromURL {
        ImageFromURL(url: imageUrl)
    }
}
