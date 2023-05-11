//
//  Watchlist.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Watchlist: View {
    
    @State var ItemList = [WatchListItem]()
    @State private var showToast: Bool = false
    @StateObject var ListData = WatchListModel()
    @State var idTaped : Int = 0
    @State var mediaTaped: String = ""
    
    let colomns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    if(self.ListData.items.count == 0){
                        Text("Watchlist is empty")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .padding(.top, 300.0)
                    }
                    else{
                        LazyVGrid(columns: colomns, spacing: 5, content: {
                            ForEach(self.ListData.items, id: \.self){
                                item in
                                WatchItem(item: item).frame(height:200)
                            }
                        })
                    }
                }
            }.onAppear(perform: {
                getUserDefaultData()
            })
            .navigationTitle("Watchlist").onAppear(perform: {
                getUserDefaultData()
            })
            
        }
    }
    
    func getUserDefaultData(){
        self.ListData.items = [WatchListItem]()
        for (key, value) in UserDefaults.standard.dictionaryRepresentation(){
            var media: String = ""
            var idStr: String = ""
            var array: [String] = []

            if(key.hasPrefix("movie")){
                media = "movie"
                array = key.components(separatedBy: "_")
            }
            else if(key.hasPrefix("tv")){
                media = "tv"
                array = key.components(separatedBy: "_")
            }

            if(array.count == 2){
                idStr = array[1]
                self.ListData.items.append(WatchListItem(id: Int(idStr)!, media: media, poster: value as! String))
            }
        }
    }
}


class WatchListModel: ObservableObject{
    @Published var selectedTab = "device"
    @Published var items = [WatchListItem]()
    @Published var currentPage: WatchListItem?
}


struct DropViewDelegate: DropDelegate{
    var item: WatchListItem
    var itemData: WatchListModel
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func dropEntered(info: DropInfo) {
        let fromIndex = itemData.items.firstIndex{
            (item) -> Bool in
            return item.id == itemData.currentPage?.id
        } ?? 0
        
        let toIndex = itemData.items.firstIndex{
            (item) -> Bool in
            return item.id == self.item.id
        } ?? 0
        
        if fromIndex != toIndex{
            let fromPage = itemData.items[fromIndex]
            itemData.items[fromIndex] = itemData.items[toIndex]
            itemData.items[toIndex] = fromPage
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
