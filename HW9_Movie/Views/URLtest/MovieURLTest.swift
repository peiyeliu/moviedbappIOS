//
//  MovieURLTest.swift
//  HW9_Movie
//
//  Created by PYL on 4/12/21.
//

import SwiftUI


struct MovieURLTest: View {
    @State private var results = [MovieTVBrief]()

    var body: some View {
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.name).font(.headline)
                Text(item.year)
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "http://localhost:3000/topmovie") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MovieTVBriefList.self, from: data) {
                    DispatchQueue.main.async {
                        debugPrint(decodedResponse)
                        self.results = decodedResponse.results
                    }
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
}

struct MovieURLTest_Previews: PreviewProvider {
    static var previews: some View {
        MovieURLTest()
    }
}
