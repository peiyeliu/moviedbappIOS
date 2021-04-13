//
//  URLTest.swift
//  HW9_Movie
//
//  Created by PYL on 4/12/21.
//
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

import SwiftUI

struct URLTest: View {
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName).font(.headline)
                Text(item.collectionName)
            }
        }.onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "http://localhost:3000/test") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
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

struct URLTest_Previews: PreviewProvider {
    static var previews: some View {
        URLTest()
    }
}
