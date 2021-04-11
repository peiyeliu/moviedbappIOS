//
//  MovieTVItemScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct MovieTVItemScroll: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                    MovieTVItem();
                    MovieTVItem();
                    MovieTVItem();
                    MovieTVItem();
                    MovieTVItem();
                    MovieTVItem();
            }
        }
    }
}

struct MovieTVItemScroll_Previews: PreviewProvider {
    static var previews: some View {
        MovieTVItemScroll()
    }
}
