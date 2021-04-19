//
//  Search.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Search: View {
    
    @ObservedObject var jsonList = MovieTVBriefWithRateList();
    @State private var urlQuery = ""
    //@ObservedObject var searchVM : SearchVM = SearchVM()
    
    var body: some View {
        NavigationView {
            ScrollView {
           
                
            }
            //.navigationTitle("Search")
            
        }
        
    }

}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
