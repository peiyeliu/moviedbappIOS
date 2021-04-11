//
//  ReviewItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct ReviewItem: View {
    var body: some View {
        NavigationLink(
            destination: ReviewPage()){
            VStack(alignment: .leading){
                Text("Review Title This is the review title").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Review Title This is the review title").font(.title3)
                Text("Star 5.0/5.0").font(.title3)
                Text("If reloading the web page was successful, you must fill out the submission web form and click on the Choose File button and select the answers text file that you have just filled out saved. Click on the Upload button. If you get any popup messages, please read them carefully and follow the suggestions there. If the submission server is busy, you should not be surprised because many students are making submissions simultaneously. So, all you have to do is to keep submitting your answers text file repeatedly until you can make a successful submission (i.e., you are presented with a submission ticket and the ticket looks right). You should save a copy of that ticket by saving the web page you see as a PDF file. It's your responsibility that you have submitted the correct answers text file.").font(.title3).lineLimit(3)
            }
            .padding(.horizontal).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1).cornerRadius(6.0)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct ReviewItem_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItem()
    }
}
