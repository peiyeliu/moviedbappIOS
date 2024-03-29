//
//  Search.swift
//  HW9_Movie
//
//  Created by pyl on 5/9/23.
//

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchResults: [MovieTVBriefWithRate] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        $searchText
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink(receiveValue: { [weak self] text in
                // query will be made only when user type at least 3 letters
                if text.count >= 3 {
                    self?.search(text)
                } else {
                    self?.searchResults = []
                }
            })
            .store(in: &cancellables)
    }

    private func search(_ text: String) {
        guard !text.isEmpty else {
            self.searchResults = []
            return
        }
        let url = URL(string: "http://localhost:3000/search/\(text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)")!
        debugPrint(url)
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MovieTVBriefWithRateList.self, decoder: JSONDecoder())
            .replaceError(with: MovieTVBriefWithRateList(results: []))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    debugPrint("Error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] detailList in
                self?.searchResults = detailList.results
            })
            .store(in: &cancellables)
    }
}

struct Search: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text: $viewModel.searchText)
                SearchResultList(items: viewModel.searchResults)
            }.navigationBarTitle(Text("Search"))
        }
    }
}
