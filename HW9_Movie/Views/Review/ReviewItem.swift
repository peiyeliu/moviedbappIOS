//
//  ReviewItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct ReviewItem: View {
    var review: Review;
    var body: some View {
        NavigationLink(
            destination: ReviewPage(review: review)){
            VStack {
                VStack(alignment: .leading){
                    Text("A review by \(review.author)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Written by \(review.author) on \(review.time)").font(.title3)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                        Text("\(review.rate)/5.0").font(.title3)
                    }
                    Text(review.content).font(.title3).lineLimit(3)
                }
                .padding(.all)
                
            }.cornerRadius(20)
        }.buttonStyle(PlainButtonStyle())   }
}

struct ReviewItem_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItem(review: reviewsDemo[0])
    }
}
