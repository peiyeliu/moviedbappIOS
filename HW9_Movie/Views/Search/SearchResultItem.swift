//
//  SearchResultItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI
import Kingfisher

struct SearchResultItem: View {
    var search: MovieTVBriefWithRate
    var body: some View {
        NavigationLink(
            destination: ResultPage(media: search.media, id: search.id) ){
            ZStack {
                KFImage(URL(string: search.poster)!).resizable().frame(width: 340
                                                                       , height: 200, alignment: .center).cornerRadius(20)
                Text("\(search.mediaStr)(\(search.year))")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.leading, -160.0)
                    .padding(/*@START_MENU_TOKEN@*/.top, -95.0/*@END_MENU_TOKEN@*/)
                Text(search.name)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.top, 170.0)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, -160.0/*@END_MENU_TOKEN@*/).lineLimit(1)
                
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.red)
                    Text(" \(search.rate)/5.0").fontWeight(.bold).foregroundColor(Color.white)
                }.padding(/*@START_MENU_TOKEN@*/.top, -95.0/*@END_MENU_TOKEN@*/).padding(/*@START_MENU_TOKEN@*/.leading, 230.0/*@END_MENU_TOKEN@*/)            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct SearchResultItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultItem(search: searchDemo[0])
    }
}
