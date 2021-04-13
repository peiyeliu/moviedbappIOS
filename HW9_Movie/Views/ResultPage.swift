//
//  ResultPage.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct ResultPage: View {
    var detail: MovieTVDetail
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    Text("Here is the youtube")
                }.frame(height: 300)
                VStack (alignment: .leading){
                    Text(detail.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Spacer()
                    Text("2022 | Magic, Magic, Magic").font(.title3)
                    Spacer()
                    Text("Star 5.0/5.0").font(.title3)
                    Spacer()
                    Text("William Shakespeare was an English playwright, poet, and actor, widely regarded as the greatest writer in the English language and the world's greatest dramatist. He is often called England's national poet and the \"Bard of Avon\".")
                }
                Divider()
                VStack (alignment: .leading){
        
                    Text("Cast & Crew").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Text("10 casts and crews").font(.title3)
                }
                Divider()
                VStack (alignment: .leading){
      
                    Text("Reviews").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Text("Top 3 reviews").font(.title3)
                    //ReviewItem()
                }
                Divider()
                VStack (alignment: .leading){
                    Text("Recommended Movies or TV shows").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
                    Text("Recommended").font(.title3)
                }.frame(height: 300)
            }
        }.navigationBarItems(
            trailing:
            HStack{
                Button(action:{
                    print("Bookmark button pressed")
                }){
                    Image(systemName: "bookmark").colorMultiply(.black)
                }
                
                Button(action:{
                    print("Bookmark button pressed")
                }){
                    Image("facebook-app-symbol").resizable().frame(width: 20, height: 20)
                }
                
                Button(action:{
                    print("Bookmark button pressed")
                }){
                    Image("twitter").resizable().frame(width: 20, height: 20)
                }
            })
    }
}

struct ResultPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResultPage(detail: MovieTVDetail(id: 0, year: "2022", media: "tv", mediaStr: "TV Shows", name: "None", poster: "", genre: "Magic", rate: "5.0", youtube: ""))
        }
    }
}
