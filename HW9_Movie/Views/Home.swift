//
//  Home.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                        Text("Now Playing")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                
                    VStack {
                        Text("Here is the Now Playing")
                    }.frame(height: 200)
                
                    VStack(alignment: .leading) {
                        Text("Top Rated Movies")
                            .font(.title)
                            .fontWeight(.bold)
                        MovieTVItemScroll(urlQuery: "topmovie")
                    }

                    VStack (alignment: .leading) {
                        Text("Popular")
                            .font(.title)
                            .fontWeight(.bold)
                        MovieTVItemScroll(urlQuery: "popmovie")
                    }
                
                   NavigationLink(destination: ResultPage(detail: MovieTVDetail(id: 0, year: "2022", media: "tv", mediaStr: "TV Shows", name: "None", poster: "", genre: "Magic", rate: "5.0", youtube: ""))) {
                       Text("Go to detail page")
                   }
            }
            .padding(.horizontal)
                .navigationBarTitle("USC Film")
                .navigationBarItems(
                    trailing:
                    HStack{
                        Button("TV shows"){}
                    })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
