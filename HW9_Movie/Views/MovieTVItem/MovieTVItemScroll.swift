//
//  MovieTVItemScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

class MovieTVItemScrollViewModel: ObservableObject {
    @Published var jsonList = [MovieTVBrief]()
    
    func loadmovies(urlQuery: String) {
        guard let url = URL(string: getURLString(str: urlQuery)) else {
            debugPrint("Invalid URL (MovieTVItemScroll)")
            return
        }
        let request = URLRequest(url: url)
        debugPrint(url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MovieTVBriefList.self, from: data) {
                    DispatchQueue.main.async {
                        self.jsonList = decodedResponse.results
                    }
                    return
                }
            }
            debugPrint("Fetch failed: \(error?.localizedDescription ?? "Unknown error (MovieTVItemScroll)")")
        }.resume()
    }
}

struct MovieTVItemScroll: View {
    var urlQuery: String
    var header: String
    @State private var selected: MovieTVBrief? = nil
    
    @ObservedObject var viewModel: MovieTVItemScrollViewModel

    var body: some View {
        VStack (alignment: .leading){
            if(!viewModel.jsonList.isEmpty){
                if(self.header.hasPrefix("Re")){
                    Text("\(self.header) \(viewModel.jsonList[0].mediaStr)").font(.title).fontWeight(.bold)
                } else {
                    Text("\(self.header)").font(.title).fontWeight(.bold)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(viewModel.jsonList, id: \.self){ item in
                        MovieTVItem(item: item)
                            .blur(radius: self.selected != nil && self.selected != item ? 10 : 0)
                            .scaleEffect(self.selected == item ? 1.2 : 1).padding(.horizontal)
                    }
                }
            }
        }.onAppear(perform: {
            viewModel.loadmovies(urlQuery: urlQuery)
        }).padding(.horizontal)
    }
}
