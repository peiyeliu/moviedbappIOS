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
    
    @State private var showAlert = false
    @State private var itemAdded = false
    @State private var isLoading = true // New state property for loading
    
    @StateObject private var viewModel = ResultPageViewModel()
    @StateObject private var castViewModel = PeopleViewModel()
    @StateObject private var reviewViewModel = ReviewScrollViewModel()
    @StateObject private var recommendViewModel = MovieTVItemScrollViewModel()
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                ScrollView {
                    VStack {
                        if let youtube = viewModel.jsonData?.youtube {
                            YoutubePicker(text: youtube)
                                .frame(height: 220)
                                .padding(.horizontal)
                        }
                        
                        if let name = viewModel.jsonData?.name,
                           let year = viewModel.jsonData?.year,
                           let genre = viewModel.jsonData?.genre,
                           let rate = viewModel.jsonData?.rate {
                            Text(name)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            Text("\(year) | \(genre)")
                                .font(.title3)
                                .padding(.top, 5.0)
                                .padding(.horizontal)
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.red)
                                Text("\(rate)/5.0")
                                    .font(.title3)
                            }
                            .padding(.top, 5.0)
                            .padding(.horizontal)
                        }
                        
                        if let overview = viewModel.jsonData?.overview {
                            Description(text: overview)
                                .padding(.top, 5.0)
                        }
                        
                        Divider()
                        PeopleScroll(media: media, id: id, viewModel: castViewModel)
                        
                        Divider()
                        ReviewScroll(media: media, id: id, viewModel: reviewViewModel)
                        
                        Divider()
                        MovieTVItemScroll(urlQuery: "recommend/\(media)/\(id)", header: "Recommended", viewModel: recommendViewModel)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(itemAdded ? "\(viewModel.jsonData?.name ?? "") was added in WatchList" : "\(viewModel.jsonData?.name ?? "") was removed from WatchList"))
        }
        .navigationBarItems(
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
                    .onTapGesture {
                        itemAdded = !itemAdded
                        showAlert = !showAlert
                        // TODO: ontap gesture for bookmark
                    }
                    
                    Link(destination: URL(string: "https://www.facebook.com/sharer/sharer.php?u=https://youtu.be/\(viewModel.jsonData?.youtube ?? "")")!) {
                        Image("facebook-app-symbol")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    
                    Link(destination: URL(string: "https://twitter.com/intent/tweet?text=Check+out+this+link%3A+https%3A%2F%2Fwww.themoviedb.org%2F\(media)%2F\(id)+%23CSCI571USCFilms")!){
                        Image("twitter").resizable().frame(width: 20, height: 20)
                    }
                }).onAppear(perform: {
                    viewModel.loaddetail(media: media, id: id)
                })
                .onReceive(viewModel.$jsonData) { _ in
                    isLoading = false // Set loading state to false when data is received
                }
    }
}

class ResultPageViewModel: ObservableObject {
    @Published var jsonData: MovieTVDetail?
    
    func loaddetail(media: String, id: Int) {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "watch", media: media, id: id)) else {
            debugPrint("Invalid URL (ResultPage)")
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
                    debugPrint("movie tv detail decode error (ResultPage) ")
                    debugPrint(url)
                }
                return
            }
            debugPrint("Fetch failed: \(error?.localizedDescription ?? "Unknown error (ResultPage)")")
        }.resume()
    }
}

