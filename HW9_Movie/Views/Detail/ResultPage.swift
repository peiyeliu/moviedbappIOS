//
//  ResultPage.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI
import youtube_ios_player_helper

struct ResultPage: View {
    var media: String
    var id: Int
    
    @State private var showToast: Bool = false
    @State private var itemAdded: Bool = false
    //@State private var bookmarkLabelName = "bookmark"
    
    @State private var jsonData = MovieTVDetail(id: 0, year: "2022", media: "dummy", mediaStr: "dummy", name: "dummy", poster: "dummy", genre: "dummy", rate: "dummy", youtube: "dummy", overview: "dummy")
    
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack{
                    YoutubePicker(text: jsonData.youtube)
                }.frame(height: 220).padding(.horizontal)
                    
            
                VStack (alignment: .leading){
                    Text(jsonData.name).font(.title).fontWeight(.bold).padding(.horizontal)
                    Text("\(jsonData.year) | \(jsonData.genre)").font(.title3).padding(.top, 5.0).padding(.horizontal)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                        Text("\(jsonData.rate)/5.0").font(.title3)
                    }.padding(.top, 5.0).padding(.horizontal)
            
                    Description(text: jsonData.overview).padding(.top, 5.0)
            
                }
                Divider()
                VStack (alignment: .leading){
                    PeopleScroll(media: media, id: id)
                }
                Divider()
                VStack (alignment: .leading){
                    ReviewScroll(media: media, id: id)
                }
                Divider()
                VStack (alignment: .leading){
                    MovieTVItemScroll(urlQuery: "recommend/\(media)/\(id)", header: "Recommended")
                }
            }.toast(isPresented: self.$showToast) {
                VStack(alignment: .leading){
                    HStack {
                        if itemAdded {
                            Text("\(jsonData.name) was added in WatchList")
                        }
                        else{
                            Text("\(jsonData.name) was removed from WatchList")
                        }
                    }
                }
            } //toast
            }.navigationBarItems(
                    trailing:
                    HStack{
                        VStack{
                            if itemAdded {
                                Image(systemName: "bookmark.fill").colorMultiply(.black)
                            }
                            else {
                                Image(systemName: "bookmark").colorMultiply(.black)
                            }
                            //Image(systemName: bookmarkLabelName).colorMultiply(.black)
                        }.onTapGesture {
                            let key = jsonData.media + "/" + String(id);
                            if(!isKeyPresentInUserDefaults(key: key)){
                                UserDefaults.standard.set(jsonData.poster, forKey: key)
                                //watchlist.set(jsonData.poster, forKey: key)
                                debugPrint("item added !!!!!!!\(key)")
                                itemAdded = true;
                                //bookmarkLabelName = "bookmark.fill"
                            }
                            else{
                                UserDefaults.standard.removeObject(forKey: key)
                                //watchlist.removeObject(forKey: key)
                                debugPrint("item removed !!!!!!!")
                                itemAdded = false
                                //bookmarkLabelName = "bookmark"
                            }
                            if (!self.showToast) {
                                withAnimation {
                                    self.showToast = true
                                }
                            }
                        }
                        
                        Link(destination: URL(string: "https://www.facebook.com/sharer/sharer.php?u=https://youtu.be/\(jsonData.youtube)")!){
                            Image("facebook-app-symbol").resizable().frame(width: 20, height: 20)
                        }
                        
                        Link(destination: URL(string: "https://twitter.com/intent/tweet?text=Check+out+this+link%3A+https%3A%2F%2Fwww.themoviedb.org%2F\(media)%2F\(id)+%23CSCI571USCFilms")!){
                            Image("twitter").resizable().frame(width: 20, height: 20)
                        }
                    }).onAppear(perform: {
                        loaddetail()
                        let key = jsonData.media + "/" + String(id);
                        if(isKeyPresentInUserDefaults(key: key)){
                            itemAdded = true
                        }
                    })
    }
    
    
    func loaddetail() {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "watch", media: media, id: id)) else {
            print("Invalid URL (ResultPage)")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(MovieTVDetail.self,from: data)
                        jsonData = decodedData
                    } catch {
                        print("movie tv detail decode error (ResultPage) ")
                        print(url)
                    }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error (ResultPage)")")
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
