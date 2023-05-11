//
//  HomeTV.swift
//  HW9_Movie
//
//  Created by PYL on 4/19/21.
//

import SwiftUI

struct HomeTV: View {
    var urlQuery: String;
    @State private var jsonList = [MovieTVBrief]()
    @State private var showLoadingPage = true
    
    @StateObject var topTVviewModel = MovieTVItemScrollViewModel()
    @StateObject var popTVviewModel = MovieTVItemScrollViewModel()
    
    
    var body: some View {
        
        ZStack {
            LoadViewer(shouldAnimate: $showLoadingPage)
            ScrollView {
                VStack(alignment: .leading){
                    Text("Trending")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                    VStack{
                        VStack {
                            ImageCarouselViewWapper(urlQuery: "list/current/tv").padding(.horizontal).frame(width: 360, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }.padding(.all)
                    }.frame( alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                
                VStack{
                    MovieTVItemScroll(urlQuery: "list/top/tv", header: "Top Rated", viewModel: topTVviewModel)
                }
                
                VStack{
                    MovieTVItemScroll(urlQuery: "list/pop/tv", header: "Popular", viewModel: popTVviewModel)
                }
                
                
                
                
            }
            .onAppear(perform: {
                loadmovies()
            })
            .navigationBarItems(trailing:
                                    HStack{
                
            })
        }
        
        
    }
    
    func loadmovies() {
        guard let url = URL(string: getURLString(str: urlQuery)) else {
            print("Invalid URL (HomeTV)")
            return
        }
        let request = URLRequest(url: url)
        print(url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MovieTVBriefList.self, from: data) {
                    
                    //DispatchQueue.main.sync{
                    self.jsonList = decodedResponse.results
                    //}
                    showLoadingPage = false
                    return
                }
            }
            
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error (HomeTV)")")
        }.resume()
    }
}

