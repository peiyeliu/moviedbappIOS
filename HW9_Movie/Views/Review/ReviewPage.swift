//
//  ReviewPage.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct ReviewPage: View {
    var review: Review
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading){
                    Text("A review by \(review.author)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("Written by \(review.author) on \(review.time)").font(.title3).foregroundColor(Color.gray)
                    Spacer()
                    Text("Star \(review.rate)/5.0").font(.title3)
                    Divider();
                    Text(review.content).font(.title3)
                }.padding(.horizontal)
            }
        }
    }
}

struct ReviewPage_Previews: PreviewProvider {
    static var previews: some View {
        ReviewPage(review: reviewsDemo[0])
    }
}