//
//  DemoSearchBar.swift
//  HW9_Movie
//
//  Created by PYL on 4/18/21.
//

import SwiftUI



struct DemoSearchBar: View {
    @State private var searchText : String = ""
    @ObservedObject var jsonList = MovieTVBriefWithRateList();

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search cars", resultList: jsonList)
                
                Text("The search text is: \(searchText)")
                
                SearchResultList(jsonList: jsonList.results)
                
            }.navigationBarTitle(Text("Search"))
                
        }
    }
}

struct DemoSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        DemoSearchBar()
    }
}
