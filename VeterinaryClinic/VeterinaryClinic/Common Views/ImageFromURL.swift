//
//  ImageFromURL.swift
//  VeterinaryClinic
//
//  Created by hiroshi on 2020/07/05.
//  Copyright © 2020 hiroshi. All rights reserved.
//

import SwiftUI

struct ImageFromURL: View {
    
    let url: String
    @ObservedObject private var imageDownloader = ImageDownloader()

    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let imageData = self.imageDownloader.downloadData {
            let img = UIImage(data: imageData)
            return VStack {
                Image(uiImage: img ?? UIImage()).resizable()
            }
        } else {
            return VStack {
                Image(uiImage: UIImage()).resizable()
            }
        }
    }
    
//    var body: Image {
//        var image: Image
//        if let imageData = self.imageDownloader.downloadData,
//            let img = UIImage(data: imageData) {
//            image = Image(uiImage: img).resizable()
//        } else {
//            image = Image(uiImage: UIImage()).resizable()
//        }
//        return image
//    }
}

struct ImageFromURL_Previews: PreviewProvider {
    static var previews: some View {
        ImageFromURL(url: "")
    }
}
