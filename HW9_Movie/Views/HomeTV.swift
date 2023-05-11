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
    @StateObject var imageCarouselViewModel = ImageCarouselViewModel();
    
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
                            ImageCarouselViewWapper(urlQuery: "list/current/tv", carouselViewModel: imageCarouselViewModel).padding(.horizontal).frame(width: 360, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
        }
        
        
    }
    
    
}

