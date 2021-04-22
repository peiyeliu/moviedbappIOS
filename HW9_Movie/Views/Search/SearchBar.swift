//
//  SearchBar.swift
//  HW9_Movie
//
//  Created by PYL on 4/16/21.
//
import SwiftUI
import UIKit

import Foundation

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String
    var resultList : MovieTVBriefWithRateList;


    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String
        let debouncer = Debouncer(delay: 0.8)
        var resultListInner : MovieTVBriefWithRateList;

        init(text: Binding<String>, resultList: MovieTVBriefWithRateList) {
            _text = text
            self.resultListInner = resultList
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            if(text.count > 2){
                loadmovies()
            }
        }
        
        public class Debouncer {
            private let delay: TimeInterval
            private var workItem: DispatchWorkItem?
            public init(delay: TimeInterval) {
                self.delay = delay
            }
            public func run(action: @escaping () -> Void) {
                workItem?.cancel()
                workItem = DispatchWorkItem(block: action)
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem!)
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
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
                            self.debouncer.run(action: {
                                self.resultListInner.results = decodedResponse.results
                            })
                        })
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }.resume()
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text, resultList: resultList)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
