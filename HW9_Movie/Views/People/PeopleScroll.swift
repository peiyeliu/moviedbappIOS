//
//  PeopleScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//

import SwiftUI

struct PeopleScroll: View {
    var media: String
    var id: Int
    
    @State private var jsonList = [Cast]()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top){
                ForEach(self.jsonList){ item in
                    PeopleItem(cast: item);
                }
            }
        }.padding(.horizontal).onAppear(perform: {
                loadcasts()
        })
    }
    
    func loadcasts() {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "cast", media: media, id: id)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CastList.self, from: data) {
                    DispatchQueue.main.async {
                        //debugPrint(decodedResponse)
                        self.jsonList = decodedResponse.results
                    }
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    
}

struct PeopleScroll_Previews: PreviewProvider {
    static var previews: some View {
        PeopleScroll(media: "movie", id: 527774)
    }
}
