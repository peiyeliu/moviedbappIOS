//
//  SearchResultItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct SearchResultItem: View {
    var body: some View {
        
        NavigationLink(
            destination: ResultPage()) {
            ZStack {
                Image("backdrop-placeholder").resizable().frame(width: 340
                                                                , height: 200, alignment: .center)
                Text("media(year)")
                    .padding(.leading, -160.0)
                    .padding(/*@START_MENU_TOKEN@*/.top, -95.0/*@END_MENU_TOKEN@*/)
                Text("name of the result")
                    .padding(.top, 170.0)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, -160.0/*@END_MENU_TOKEN@*/)
                
                Text("star 5.0").padding(/*@START_MENU_TOKEN@*/.top, -95.0/*@END_MENU_TOKEN@*/).padding(/*@START_MENU_TOKEN@*/.leading, 250.0/*@END_MENU_TOKEN@*/)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct SearchResultItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultItem()
    }
}
