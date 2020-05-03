//
//  ImageLoader.swift
//  EmberNewsApp1
//
//  Created by user165733 on 5/2/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var Image: UIImage?
        var urlString: String?

    init(urlString: String) {
        self.urlString = urlString
        loadImage()
    }
    
    func loadImage() {
        fetchData()
    }
    
      func fetchData() {
        if let url = URL(string: urlString!) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error == nil {
                        if let safeData = data {
                            do {
                                DispatchQueue.main.async {
                                    guard let loadedImage = UIImage(data: safeData) else {
                                        return
                                    }
                                    
                                    self.Image = loadedImage
                                    //print(self.posts[1].title)
                                }
                            }                        }
                    }
                }
                task.resume()
            }
        }
        
    }

