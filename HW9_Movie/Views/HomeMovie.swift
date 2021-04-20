//
//  HomeMovie.swift
//  HW9_Movie
//
//  Created by PYL on 4/19/21.
//

import SwiftUI

struct HomeMovie: View {
    var urlQuery: String;
    @State private var jsonList = [MovieTVBrief]()
    @State private var showLoadingPage = true
    
    var body: some View {
                    ZStack {
                        LoadViewer(shouldAnimate: $showLoadingPage)
                        ScrollView {
                                VStack(alignment: .leading){
                                    Text("Now Playing")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                    VStack{
                                        VStack {
                                            ImageCarouselViewWapper(urlQuery: "currentmovie").padding(.horizontal).frame(width: 360, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        }.padding(.all)
                                    }.frame( alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                            
                                VStack{
                                    MovieTVItemScroll(urlQuery: "topmovie", header: "Top Rated")
                                }

                                VStack{
                                    MovieTVItemScroll(urlQuery: "popmovie", header: "Popular")
                                }
                            

                        }
                        .onAppear(perform: {
                            loadmovies()
                        })
                    }
                    
                
             
    }
    
    func loadmovies() {
        guard let url = URL(string: getURLString(str: urlQuery)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MoiveTVBriefList.self, from: data) {

                    //DispatchQueue.main.sync{
                        self.jsonList = decodedResponse.results
                    //}
                    showLoadingPage = false
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct HomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        HomeMovie(urlQuery: "currentmovie")
    }
}
