//
//  PeopleScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//

import SwiftUI

class PeopleViewModel: ObservableObject {
    @Published var jsonList = [Cast]()

    init(media: String, id: Int) {
        loadcasts(media: media, id: id)
    }

    func loadcasts(media: String, id: Int) {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "cast", media: media, id: id)) else {
            print("Invalid URL (People Scroll)")
            return
        }
        let request = URLRequest(url: url)
        print(url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(CastList.self, from: data) {
                    DispatchQueue.main.async {
                        self.jsonList = decodedResponse.results
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error (People Scroll)")")
        }.resume()
    }
}

struct PeopleScroll: View {
    @ObservedObject var viewModel: PeopleViewModel

    var body: some View {
        VStack (alignment:.leading){
            if(!viewModel.jsonList.isEmpty){
                Text("Cast & Crew").font(.title).fontWeight(.bold)}
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top){
                    ForEach(viewModel.jsonList){ item in
                        PeopleItem(cast: item)
                    }
                }
            }
        }.padding(.horizontal)
    }
}

