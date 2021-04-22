//
//  Watchlist.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Watchlist: View {
    
    @State var ItemList = [WatchListItem]()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    if(ItemList.count == 0){
                        Text("Watchlist is empty")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .padding(.top, 300.0)
                    }
                    else{
                        ForEach(ItemList){
                           item in
                           WatchItem(item: item)
                        }
                        
                    }
                }
            }
            .navigationTitle("Watchlist").onAppear(perform: {
                getUserDefaultData()
            })
        }
    }
    
    func getUserDefaultData(){
        for (key, value) in UserDefaults.standard.dictionaryRepresentation(){
            var media: String = ""
            var idStr: String = ""
            var array: [String] = []
            if(key.hasPrefix("movie")){
                media = "movie"
                array = key.components(separatedBy: "/")
            }
            else if(key.hasPrefix("tv")){
                media = "tv"
                array = key.components(separatedBy: "/")
            }
            if(array.count == 2){
                idStr = array[1]
                debugPrint("\(media) and \(idStr)");
                self.ItemList.append(WatchListItem(id: Int(idStr)!, media: media, poster: value as! String))
                debugPrint(self.ItemList.count)
            }
        }
    }
}

struct Watchlist_Previews: PreviewProvider {
    static var previews: some View {
        Watchlist()
    }
}


//extension String {
//    func index(from: Int) -> Index {
//        return self.index(startIndex, offsetBy: from)
//    }
//
//    func substring(from: Int) -> String {
//        let fromIndex = index(from: from)
//        return String(self[fromIndex...])
//    }
//
//    func substring(to: Int) -> String {
//        let toIndex = index(from: to)
//        return String(self[..<toIndex])
//    }
//
//    func substring(with r: Range<Int>) -> String {
//        let startIndex = index(from: r.lowerBound)
//        let endIndex = index(from: r.upperBound)
//        return String(self[startIndex..<endIndex])
//    }
//}
