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
    @State private var showToast: Bool = false
    var body: some View {
        NavigationLink (
            destination: ResultPage(media: item.media, id: item.id)){
            VStack{
                KFImage(URL(string: item.poster)!).resizable().frame(width: 120, height: 180, alignment: .center)
            }.onLongPressGesture {
                if (!self.showToast) {
                    withAnimation {
                        self.showToast = true
                    }
                }
            }
        }.buttonStyle(PlainButtonStyle()).itemtoast(isPresented: self.$showToast) {
            VStack(alignment: .leading){
                HStack {
                    Text("Remove from WatchList")
                    Spacer()
                    Image(systemName: "bookmark").colorMultiply(.black)
                }
                .onTapGesture {
                    let key = item.media + "/" + String(item.id);
                    if(!isKeyPresentInUserDefaults(key: key)){
                    }
                    else{
                        UserDefaults.standard.removeObject(forKey: key)
                        
                    }
                }
                }
            }
    }
}

struct WatchItem_Previews: PreviewProvider {
    static var previews: some View {
        let demoItem = WatchListItem(id: 527774, media: "movie", poster: "https://image.tmdb.org/t/p/w500/lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg")
        WatchItem(item: demoItem)
    }
}
