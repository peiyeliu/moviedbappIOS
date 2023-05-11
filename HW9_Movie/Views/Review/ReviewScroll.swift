//
//  ReviewScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/12/21.
//

import SwiftUI

class ReviewScrollViewModel: ObservableObject {
    @Published var jsonList = [Review]()
    
    func loadreviews(media: String, id: Int) {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "review", media: media, id: id)) else {
            print("Invalid URL (ReviewScroll)")
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
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error (ReviewScroll)")")
        }.resume()
    }
}

struct ReviewScroll: View {
    var media: String
    var id: Int
    
    @StateObject var viewModel: ReviewScrollViewModel;
    
    var body: some View {
        VStack (alignment: .leading){
            if(!viewModel.jsonList.isEmpty){
                Text("Reviews").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
            }
            ForEach(viewModel.jsonList){ item in
                ReviewItem(review: item)
            }
        }.onAppear(perform: {
            viewModel.loadreviews(media: media, id: id)
        }).padding(.horizontal)
    }
}
