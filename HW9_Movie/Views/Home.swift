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
    @State private var toggleLabel = "TV Shows"
    var body: some View {
            NavigationView {
                ScrollView{
                    if isMovie{
                        HomeMovie(urlQuery: "currentmovie")
                    }
                    else{
                        HomeTV(urlQuery: "currenttv")
                    }
                    Link(destination: URL(string: "https://www.themoviedb.org")!, label: {
                        VStack(alignment: .center){
                            Text("Powered by TMDB").foregroundColor(.gray)
                            Text("Developed by Peiye Liu").foregroundColor(.gray)
                        }
                    })
                }.navigationBarItems(trailing: Button(action: {
                    if isMovie{
                        isMovie = false
                        toggleLabel = "Movies"
            
                    }
                    else{
                        isMovie = true
                        toggleLabel = "TV Shows"
                    }
                }, label: {
                    Text("\(toggleLabel)")
                })).navigationTitle("USC Film")
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
