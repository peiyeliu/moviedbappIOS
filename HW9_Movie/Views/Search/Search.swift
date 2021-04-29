//
//  Search.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Search: View {
    @State var searchText: String = ""
    @ObservedObject var jsonList: MovieTVBriefWithRateList = MovieTVBriefWithRateList();

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search", resultList: jsonList)
                
                Text("The search text is: \(searchText)")
                    .foregroundColor(Color.white)

//                VStack {
//                    ScrollView{
//                        ForEach(jsonList.results){ item in
//                            SearchResultItem(search: item);
//                        }
//                    }
                    SearchResultList(jsonList: jsonList.results)
//                }
                
            }.navigationBarTitle(Text("Search"))
                
        }
    }

}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
