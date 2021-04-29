//
//  ReviewScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/12/21.
//

import SwiftUI

struct ReviewScroll: View {
    var media: String
    var id: Int
    
    @State private var jsonList = [Review]()
    var body: some View {
        VStack (alignment: .leading){
            if(!jsonList.isEmpty){
                Text("Reviews").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
            }
            ForEach(self.jsonList){ item in
                ReviewItem(review: item)
            }
        }.onAppear(perform: {
            loadreviews()
        }).padding(.horizontal)
    }
    
    func loadreviews() {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "review", media: media, id: id)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(ReviewList.self, from: data) {
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

struct ReviewScroll_Previews: PreviewProvider {
    static var previews: some View {
        ReviewScroll(media: "movie", id: 527774)
    }
}
