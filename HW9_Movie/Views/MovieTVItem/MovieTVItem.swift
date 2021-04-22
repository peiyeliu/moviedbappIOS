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
    @State private var showToast: Bool = false
    
    var body: some View {
        NavigationLink (
            destination: ResultPage(media: item.media, id: item.id)){
            VStack{
                KFImage(URL(string: item.poster)!).resizable().frame(width: 120, height: 180, alignment: .center).cornerRadius(20)
                Text(item.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center).frame(width: 120)
                Text("(\(item.year))")
                    .foregroundColor(Color.gray)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct MovieTVItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieTVItem(item: currMoviesDemo[0]);
    }
}



