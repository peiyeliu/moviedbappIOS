//
//  MovieTVItemScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct MovieTVItemScroll: View {
    var urlQuery: String;
    var header: String
    @State private var jsonList = [MovieTVBrief]()
    
    @State private var selected: MovieTVBrief? = nil
    var body: some View {
        VStack (alignment: .leading){
            if(!jsonList.isEmpty){
                if(self.header.hasPrefix("Re")){
                Text("\(self.header) \(jsonList[0].mediaStr)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                }else{
                    Text("\(self.header)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(jsonList, id: \.self){ item in
                        MovieTVItem(item: item)
                            .blur(radius: self.selected != nil && self.selected != item ? 10 : 0)
                        .scaleEffect(self.selected == item ? 1.2 : 1).padding(.horizontal)
                        }
                    }
                }
            }.onAppear(perform: {
                loadmovies()
        })
        .padding(.horizontal)
    }
    
    func loadmovies() {
        guard let url = URL(string: getURLString(str: urlQuery)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MovieTVBriefList.self, from: data) {
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

struct MovieTVItemScroll_Previews: PreviewProvider {
    static var previews: some View {
        MovieTVItemScroll(urlQuery: "topmovie", header: "Recommended");
    }
}
