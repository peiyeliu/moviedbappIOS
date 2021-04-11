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
                    Text("This is watch list")
                }
            }
            .navigationTitle("Watchlist")
        }
    }
}

struct Watchlist_Previews: PreviewProvider {
    static var previews: some View {
        Watchlist()
    }
}
