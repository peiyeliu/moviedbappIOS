//
//  MovieTVItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct MovieTVItem: View {
    var body: some View {
        NavigationLink (
            destination: ResultPage()){
            VStack{
                Image("movie_placeholder").resizable().frame(width: 120, height: 180, alignment: .center)
                Text("Movie name").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("(2020)")
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct MovieTVItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieTVItem()
    }
}
