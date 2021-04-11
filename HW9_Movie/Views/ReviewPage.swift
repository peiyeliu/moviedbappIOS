//
//  ReviewPage.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct ReviewPage: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading){
                    Text("Review Title This is the review title").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("Review Title This is the review title").font(.title3)
                    Spacer()
                    Text("Star 5.0/5.0").font(.title3)
                    Spacer()
                    Text("Review Title This is the review title").font(.title3)
                }
            }
        }
    }
}

struct ReviewPage_Previews: PreviewProvider {
    static var previews: some View {
        ReviewPage()
    }
}
