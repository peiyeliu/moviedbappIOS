//
//  Home.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI
import Kingfisher

struct Home: View {

    @State private var isMovie = true
    @State private var toggleLabel = "movie"
    var body: some View {
            NavigationView {
                VStack{
                    if isMovie{
                        HomeMovie(urlQuery: "currentmovie")
                    }
                    else{
                        HomeTV(urlQuery: "currenttv")
                    }
                }.navigationBarItems(trailing: Button(action: {
                    if isMovie{
                        isMovie = false;
                        toggleLabel = "TV Shows"
            
                    }
                    else{
                        isMovie = true;
                        toggleLabel = "Movies"
                    }
                }, label: {
                    Text("\(toggleLabel)")
                })).navigationBarTitle("USC Film")
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
