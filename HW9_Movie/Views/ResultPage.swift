//
//  ResultPage.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct ResultPage: View {
    var media: String
    var id: Int
    
    @State private var jsonData = MovieTVDetail(id: 0, year: "2022", media: "dummy", mediaStr: "dummy", name: "dummy", poster: "dummy", genre: "dummy", rate: "dummy", youtube: "dummy", overview: "dummy")
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    Text("Here is the youtube")
                }.frame(height: 300)
                    
                
                VStack (alignment: .leading){
                    Text(jsonData.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Spacer()
                    Text("\(jsonData.year) | \(jsonData.genre)").font(.title3)
                    Spacer()
                    Text("Star \(jsonData.rate)").font(.title3)
                    Spacer()
                    Text(jsonData.overview)
                }.onAppear(perform: {
                    loaddetail()
                })
                
                Divider()
                VStack (alignment: .leading){
        
                    Text("Cast & Crew").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Text("10 casts and crews").font(.title3)
                    PeopleScroll(media: media, id: id)
                }
                Divider()
                VStack (alignment: .leading){
      
                    Text("Reviews").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Text("Top 3 reviews").font(.title3)
                    ReviewScroll(media: media, id: id)
                }
                Divider()
                VStack (alignment: .leading){
                    Text("Recommended Movies or TV shows").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Text("Recommended").font(.title3)
                    MovieTVItemScroll(urlQuery: "recommend/\(media)/\(id)")
                }.frame(height: 300)
            }
        }.navigationBarItems(
            trailing:
            HStack{
                Button(action:{
                    print("Bookmark button pressed")
                }){
                    Image(systemName: "bookmark").colorMultiply(.black)
                }
                
                Button(action:{
                    print("Bookmark button pressed")
                }){
                    Image("facebook-app-symbol").resizable().frame(width: 20, height: 20)
                }
                
                Button(action:{
                    print("Bookmark button pressed")
                }){
                    Image("twitter").resizable().frame(width: 20, height: 20)
                }
            })
    }
    
    
    func loaddetail() {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "watch", media: media, id: id)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(MovieTVDetail.self,from: data)
                        jsonData = decodedData
                    } catch {
                        print("decode error")
                    }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ResultPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResultPage(media: "movie", id: 527774)
        }
    }
}
