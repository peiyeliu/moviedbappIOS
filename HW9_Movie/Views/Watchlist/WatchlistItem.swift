//
//  WatchlistItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/18/21.
//

import SwiftUI
import Kingfisher

struct WatchItem: View {
    var item: WatchListItem
    var body: some View {
        NavigationLink (
            destination: ResultPage(media: item.media, id: item.id)){
            VStack{
                KFImage(URL(string: item.poster)!).resizable().frame(width: 120, height: 180, alignment: .center)
            }
        }.buttonStyle(PlainButtonStyle())
    }
}

struct WatchItem_Previews: PreviewProvider {
    static var previews: some View {
        let demoItem = WatchListItem(id: 527774, media: "movie", poster: "https://image.tmdb.org/t/p/w500/lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg")
        WatchItem(item: demoItem)
    }
}
