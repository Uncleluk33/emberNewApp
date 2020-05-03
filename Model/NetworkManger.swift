//
//  NetworkManger.swift
//  EmberNewsApp1
//
//  Created by user165733 on 5/2/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=a7dc708abe1445f39597991b7ebe0513") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            print("safeData = \(safeData)")
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                print("test = \(results.articles[0].title)")
                                self.posts = results.articles
//                                print(self.posts)
                            }
                        }catch{
                            print("error = \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
