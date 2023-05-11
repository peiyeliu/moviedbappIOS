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
    @StateObject var movieCarouseviewModel = ImageCarouselViewModel()
    
    var body: some View {
        ZStack {
            //LoadViewer(shouldAnimate: $showLoadingPage)
            ScrollView {
                VStack(alignment: .leading){
                    Text("Now Playing")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                    VStack{
                        VStack {
                            ImageCarouselViewWapper(urlQuery: "list/current/movie", carouselViewModel: movieCarouseviewModel).padding(.horizontal).frame(width: 360, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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

        }
        
        
        
    }
    
   
}


