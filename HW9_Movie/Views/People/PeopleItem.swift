//
//  PeopleItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI
import Kingfisher

struct PeopleItem: View {
    var cast: Cast
    
    var body: some View {
        VStack {
            KFImage(URL(string: cast.photo)!).resizable().frame(width: 80, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 0))
                .shadow(radius: 7)
            Text(cast.name).font(.caption).padding(.top, -25.0).frame(width: 80, alignment: .center)
        }
    }
}

struct PeopleItem_Previews: PreviewProvider {
    static var previews: some View {
        PeopleItem(cast: castsDemo[0])
    }
}
