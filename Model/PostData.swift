//
//  PostData.swift
//  EmberNewsApp1
//
//  Created by user165733 on 5/2/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let articles: [Post]
}


struct Post: Decodable, Identifiable {
    
    var id: String{
        return publishedAt
    } 
    let publishedAt: String
    let urlToImage: String?
    let title: String
    let url: String?
    let author: String?
}


//struct Source: Decodable{
//    let id: String
//    let name: String
//}
