//
//  SearchResultList.swift
//  HW9_Movie
//
//  Created by pyl on 5/9/23.
//

import SwiftUI

struct SearchResultList: View {
    var items: [MovieTVBriefWithRate]
    var body: some View {
        ScrollView{
            ForEach(items) { item in
                SearchResultItem(search: item)
            }
        }
    }
}
