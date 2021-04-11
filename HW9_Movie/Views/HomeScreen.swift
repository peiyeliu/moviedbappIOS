//
//  HomeScreen.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        TabView{
            Search().tabItem { Label("Search", systemImage: "magnifyingglass") }
            Home().tabItem { Label("Home", systemImage: "house")  }
            Watchlist().tabItem { Label("Watchlist", systemImage: "suit.heart")  }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
