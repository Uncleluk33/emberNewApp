//
//  DetailView.swift
//  EmberNewsApp1
//
//  Created by user165733 on 5/2/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        
        WebView(urlString: url)

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
