//
//  ResultPage.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI
import youtube_ios_player_helper
import Combine



struct ResultPage: View {
    var media: String
    var id: Int
    
    @State private var showToast: Bool = false
    @State private var itemAdded: Bool = false
    
    
    
    @StateObject private var viewModel = ResultPageViewModel()
    @StateObject var reviewViewModel = ReviewScrollViewModel()
    @StateObject var recommendViewModel = MovieTVItemScrollViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack{
                    YoutubePicker(text: viewModel.jsonData.youtube)
                        .frame(height: 220)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        Text(viewModel.jsonData.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text("\(viewModel.jsonData.year) | \(viewModel.jsonData.genre)")
                            .font(.title3)
                            .padding(.top, 5.0)
                            .padding(.horizontal)
                        
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.red)
                            Text("\(viewModel.jsonData.rate)/5.0")
                                .font(.title3)
                        }
                        .padding(.top, 5.0)
                        .padding(.horizontal)
                        
                        Description(text: viewModel.jsonData.overview)
                            .padding(.top, 5.0)
                        
                        Divider()
                        
                        PeopleScroll(viewModel: PeopleViewModel(media: media, id: id))
                        
                        Divider()
                        
                        ReviewScroll(media: media, id: id, viewModel: reviewViewModel)
                        
                        Divider()
                        
                        MovieTVItemScroll(urlQuery: "recommend/\(media)/\(id)", header: "Recommended", viewModel: recommendViewModel)
                    }
                    .padding(.horizontal)
                }
            }
//            .toast(isPresented: self.$showToast) {
//                VStack(alignment: .leading){
//                    HStack {
//                        if itemAdded{
//                            Text("\(viewModel.jsonData.name) was added in WatchList")
//                        }
//                        else{
//                            Text("\(viewModel.jsonData.name) was removed from WatchList")
//                        }
//                    }
//                }
//            }
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
                    }
//                    .onTapGesture {
//                        let key = "itemAdded_\(media)_\(id)";
//                        if(!isKeyPresentInUserDefaults(key: key)){
//                            UserDefaults.standard.set(viewModel.jsonData.poster, forKey: key)
//                            debugPrint("item added !!!!!!!\(key)")
//                            itemAdded = true
//                        }
//                        else{
//                            UserDefaults.standard.removeObject(forKey: key)
//                            debugPrint("item removed !!!!!!!")
//                            itemAdded = false
//                        }
//                        if (!self.showToast) {
//                            withAnimation {
//                                self.showToast = true
//                            }
//                        }
//                    }
                    
                    Link(destination: URL(string: "https://www.facebook.com/sharer/sharer.php?u=https://youtu.be/\(viewModel.jsonData.youtube)")!){
                        Image("facebook-app-symbol").resizable().frame(width: 20, height: 20)
                    }
                    
                    Link(destination: URL(string: "https://twitter.com/intent/tweet?text=Check+out+this+link%3A+https%3A%2F%2Fwww.themoviedb.org%2F\(media)%2F\(id)+%23CSCI571USCFilms")!){
                        Image("twitter").resizable().frame(width: 20, height: 20)
                    }
                }).onAppear(perform: {
                    viewModel.loaddetail(media: media, id: id)
//                    itemAdded = UserDefaults.standard.bool(forKey: "itemAdded_\(media)_\(id)")
                })
    }
    
    
    
}

class ResultPageViewModel: ObservableObject {
    @Published var jsonData = MovieTVDetail(id: 0, year: "2022", media: "dummy", mediaStr: "dummy", name: "dummy", poster: "dummy", genre: "dummy", rate: "dummy", youtube: "dummy", overview: "dummy")
    
    func loaddetail(media: String, id: Int) {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "watch", media: media, id: id)) else {
            print("Invalid URL (ResultPage)")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(MovieTVDetail.self,from: data)
                    DispatchQueue.main.async {
                        self.jsonData = decodedData
                    }
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

