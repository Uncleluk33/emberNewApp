//
//  UrlImageView.swift
//  EmberNewsApp1
//
//  Created by user165733 on 5/2/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(urlString: String?) {
        imageLoader = ImageLoader(urlString: urlString ?? "")
    }
    
    var body: some View {
        Image(uiImage: imageLoader.Image ?? UrlImageView.defaultImage!)
        .resizable()
        .frame(width: 100, height: 70)
        .cornerRadius(5)    }
    
    static var defaultImage = UIImage(named: "newspaperIcon")
    
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}

