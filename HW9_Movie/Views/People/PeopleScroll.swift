//
//  PeopleScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//

import SwiftUI

class PeopleViewModel: ObservableObject {
    @Published var castList: [Cast] = []

    func loadCasts(media: String, id: Int) {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "cast", media: media, id: id)) else {
            debugPrint("Invalid URL (People Scroll)")
            return
        }
        let request = URLRequest(url: url)
        debugPrint(url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                debugPrint("Fetch failed: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let decodedResponse = try? JSONDecoder().decode(CastList.self, from: data) {
                DispatchQueue.main.async {
                    self.castList = decodedResponse.results
                }
            }
        }.resume()
    }
}

struct PeopleScroll: View {
    var media: String
    var id: Int
    @StateObject var viewModel = PeopleViewModel()

    var body: some View {
        VStack (alignment:.leading){
            if !viewModel.castList.isEmpty {
                Text("Cast & Crew")
                    .font(.title)
                    .fontWeight(.bold)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(viewModel.castList) { item in
                            PeopleItem(cast: item)
                        }
                    }
                }.padding(.horizontal)
            }
        }.onAppear(perform: {
            viewModel.loadCasts(media: media, id: id)
        })
    }
}

