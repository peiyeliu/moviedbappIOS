//
//  MovieTVItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI
import Kingfisher


struct MovieTVItem: View {
    var item: MovieTVBrief;
    var body: some View {
        NavigationLink (
            destination: ResultPage()){
            VStack{
                KFImage(URL(string: item.poster)!).resizable().frame(width: 120, height: 180, alignment: .center)
                Text(item.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(width: 120)
                Text("(\(item.year))")
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct MovieTVItem_Previews: PreviewProvider {
    static var previews: some View {
        //MovieTVItem(item: MovieTVBrief(id: 0, year: "2020", media: "movie", mediaStr: "Movies", name: "The world", poster: "movie_placeholder"));
        MovieTVItem(item: currMovies[0]);
    }
}
