//
//  MovieTVItemScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

func buildDummyArrays()->[MovieTVBrief]{
    var array = [MovieTVBrief]();
    var newElement = MovieTVBrief(id: 0, year: "2020", media: "movie", mediaStr: "Movies", name: "The world", poster: "movie_placeholder");
    array.append(newElement);
    array.append(newElement);
    array.append(newElement);
    array.append(newElement);
    array.append(newElement);
    array.append(newElement);
    return array;
}


struct MovieTVItemScroll: View {
    var jsonList: [MovieTVBrief];
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top){
                ForEach(self.jsonList){ item in
                    MovieTVItem(item: item);
                }
            }
        }
    }
}

struct MovieTVItemScroll_Previews: PreviewProvider {
    static var previews: some View {
        // let array = buildDummyArrays();
        MovieTVItemScroll(jsonList: currMovies);
    }
}
