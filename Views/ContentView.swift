//
//  ContentView.swift
//  EmberNewsApp1
//
//  Created by user165733 on 5/2/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    
    
    //        let myDateFormatter = DateFormatter()
    //        myDateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
    
    
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                
                HStack {
                    
                    UrlImageView(urlString: post.urlToImage)
                    
                    
                    VStack {
                        Text(post.title)
                            .font(Font.custom("TimesNewRomanPS-ItalicMT", size: 15)
                                .bold()
                        )
                        HStack {
                            Text(post.author ?? "No Author")
                                .font(Font.custom("TimesNewRomanPS-ItalicMT", size: 10)
                            )
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text(DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .none))
                                .font(Font.custom("TimesNewRomanPS-ItalicMT", size: 10)
                            )
                                .foregroundColor(.gray)
                        }
                    }
                    
                    }
                }
                    
            }
            .navigationBarTitle("My News")
            
        }
        .onAppear {
            self.networkManager.fetchData()
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    struct Post: Identifiable {
        var id: Int
        
        let image: String
        let title: String
    }
    
    let posts = [
        Post(id: 1, image: "dimond", title: "this is the title of the article"),
        Post(id: 2, image: "dimond", title: "this is the title of article 2"),
        Post(id: 3, image: "dimond", title: "this is the title of article 3")
    ]
    
}




