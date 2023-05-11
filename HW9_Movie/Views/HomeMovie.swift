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
    
    @StateObject var topMovieviewModel = MovieTVItemScrollViewModel()
    @StateObject var popMovieviewModel = MovieTVItemScrollViewModel()
    
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
                            ImageCarouselViewWapper(urlQuery: "list/current/movie").padding(.horizontal).frame(width: 360, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding(.all)
                    }.frame( alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                VStack{
                    MovieTVItemScroll(urlQuery: "list/top/movie", header: "Top Rated", viewModel: topMovieviewModel)
                }.frame(height: 300)
                
                VStack{
                    MovieTVItemScroll(urlQuery: "list/pop/movie", header: "Popular", viewModel: popMovieviewModel)
                }.frame(height: 300)
                
                
            }
            .onAppear(perform: {
                loadmovies()
            })
        }
        
        
        
    }
    
    func loadmovies() {
        guard let url = URL(string: getURLString(str: urlQuery)) else {
            debugPrint("Invalid URL (HomeMovie)")
            return
        }
        let request = URLRequest(url: url)
        debugPrint(url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                debugPrint("Invalid response status code: \(response.statusCode)")
                return
            }
            
            guard let data = data else {
                debugPrint("Data is missing or empty (HomeMovie)")
                return
            }
            
            
            do {
                let decodedResponse = try JSONDecoder().decode(MovieTVBriefList.self, from: data)
                DispatchQueue.main.async {
                    self.jsonList = decodedResponse.results
                }
                showLoadingPage = false
            } catch let decodingError {
                debugPrint("Error decoding JSON: \(decodingError.localizedDescription)")
                debugPrint("At (HomeMovie)")
            }
        }.resume()
    }
}


