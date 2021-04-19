//
//  SearchBar.swift
//  HW9_Movie
//
//  Created by PYL on 4/16/21.
//
import SwiftUI
import UIKit

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String
    @ObservedObject var resultList : MovieTVBriefWithRateList;

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        if(text != ""){
            loadmovies()
        }
        else{
            resultList.results = [MovieTVBriefWithRate]();
        }
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
        if(text != ""){
            loadmovies()
        }
        else{
            resultList.results = [MovieTVBriefWithRate]();
        }
    }
    
    func loadmovies() {
        guard let url = URL(string: getSearchURL(keyword: text)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MovieTVBriefWithRateList.self, from: data) {
                    DispatchQueue.main.async {
                        self.resultList.results = decodedResponse.results
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

}
