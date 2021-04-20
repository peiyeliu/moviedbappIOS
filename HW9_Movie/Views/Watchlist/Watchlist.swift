//
//  Watchlist.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Watchlist: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    if(listSize == 0){
                        Text("Watchlist is empty")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .padding(.top, 300.0)
                    }
                    else{
                    }
                }
            }
            //.navigationTitle("Watchlist")
        }
    }
}

struct Watchlist_Previews: PreviewProvider {
    static var previews: some View {
        Watchlist()
    }
}
