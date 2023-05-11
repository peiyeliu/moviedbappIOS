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
                    KFImage(URL(string: item.poster)!).resizable().frame(width: 120, height: 180, alignment: .center).cornerRadius(20)
                }
            }.buttonStyle(PlainButtonStyle())
    }
}


