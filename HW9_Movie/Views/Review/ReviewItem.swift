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
                    Text("A review by \(review.author)").font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Written by \(review.author) on \(review.time)").font(.subheadline).foregroundColor(Color.gray)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                        Text("\(review.rate)/5.0").font(.body)
                    }
                    Text(review.content).font(.body).lineLimit(3)
                }
                .padding(.all)
                .frame(minWidth: 0, maxWidth: .infinity) 
                
            }.overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2).foregroundColor(.gray)
            )
        }.buttonStyle(PlainButtonStyle())
        
    }
}

