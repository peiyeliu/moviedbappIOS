//
//  HomeScreen.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection){
            Search().tabItem { Label("Search", systemImage: "magnifyingglass") }.tag(1)
            Home().tabItem { Label("Home", systemImage: "house")  }.tag(2)
            Watchlist().tabItem { Label("Watchlist", systemImage: "suit.heart")  }.tag(3)
        }.onAppear{
            resetDefaults()
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
