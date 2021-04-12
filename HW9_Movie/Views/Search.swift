//
//  Search.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI
import SwiftyJSON

struct Search: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Search Bar").frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                VStack {
//                    SearchResultItem()
//                    SearchResultItem()
//                    SearchResultItem()
//                    SearchResultItem()
                }
            }.navigationTitle("Search")
        }
    
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
