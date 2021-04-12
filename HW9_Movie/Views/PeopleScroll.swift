//
//  PeopleScroll.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//

import SwiftUI

struct PeopleScroll: View {
    var jsonList: [Cast]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top){
                ForEach(self.jsonList){ item in
                    PeopleItem(cast: item);
                }
            }
        }.padding(.horizontal)
    }
}

struct PeopleScroll_Previews: PreviewProvider {
    static var previews: some View {
        PeopleScroll(jsonList: castsDemo)
    }
}
