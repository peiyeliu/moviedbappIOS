//
//  Search.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Search: View {
    
    @State private var jsonList = [MovieTVBriefWithRate]()
    @State private var urlQuery : String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(text: $urlQuery)
                    List{
                        ForEach(jsonList){
                            item in
                            //Text(item.name)
                            SearchResultItem(search: item)
                        }
                    }
            }.onAppear(perform: {
                loadmovies()
            })
            //.navigationTitle("Search")
            
        }
        
       
    
    }
    func loadmovies() {
        guard let url = URL(string: getSearchURL(keyword: urlQuery)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MoiveTVBriefWithRateList.self, from: data) {
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

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
