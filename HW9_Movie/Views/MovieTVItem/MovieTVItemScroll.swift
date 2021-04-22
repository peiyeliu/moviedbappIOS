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
    var body: some View {
        VStack (alignment: .leading){
            if(!jsonList.isEmpty){
                Text("\(self.header) \(jsonList[0].mediaStr)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
            }
            ScrollView(.horizontal, showsIndicators: false){
        
                HStack(alignment: .top){
                    ForEach(jsonList){ item in
                        MovieTVItem(item: item);
                    }
                }
            }.onAppear(perform: {
                loadmovies()
        })
        }.padding(.horizontal)
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
