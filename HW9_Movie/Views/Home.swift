//
//  Home.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI
import Kingfisher

struct Home: View {
    var urlQuery: String;
    @State private var jsonList = [MovieTVBrief]()
    
    var body: some View {
        NavigationView {
            ScrollView {
    
                    VStack(alignment: .leading){
                        Text("Now Playing")
                            .font(.title)
                            .fontWeight(.bold)
                        VStack{
                            ImageCarouselViewWapper(urlQuery: "currentmovie").frame(width: 360, height: 380, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
            .navigationBarItems(trailing:
              HStack{
                    Button("TV shows"){}
              })
            
        }         //.navigationBarTitle("USC Film")
             
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
                    DispatchQueue.main.async {
                        self.jsonList = decodedResponse.results
                    }
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(urlQuery: "currentmovie")
    }
}
