//
//  SearchResultList.swift
//  HW9_Movie
//
//  Created by PYL on 4/18/21.
//

import SwiftUI

struct SearchResultList: View {
    
    //var queryStr: String
    var jsonList : [MovieTVBriefWithRate]
    
    var body: some View {
        ScrollView{
            ForEach(jsonList){ item in
                SearchResultItem(search: item);
            }
        }
    }

}

struct SearchResultList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let dummyList = [MovieTVBriefWithRate]()
            SearchResultList(jsonList: dummyList)
        }
    }
}
