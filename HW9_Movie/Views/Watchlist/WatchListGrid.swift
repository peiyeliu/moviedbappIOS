//
//  WatchListGrid.swift
//  HW9_Movie
//
//  Created by PYL on 4/20/21.
//

import SwiftUI
import WebKit

struct WatchListGrid: View {
    let colomns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    var list = [WatchListItem]()
    var body: some View {
        VStack {
            ScrollView{
                Text("item added");
                
//                LazyVGrid(columns: colomns, spacing: 20, content: {
//                    ForEach(listData.list){
//                        item in
//                        Text("item added");
//                    }
//                })
            }.onAppear(perform: {
//                loadWatchList()
            })
        }
    }
    
//    func loadWatchList(){
//        for (key, value) in watchlist.dictionaryRepresentation(){
//
//        }
//    }
}

