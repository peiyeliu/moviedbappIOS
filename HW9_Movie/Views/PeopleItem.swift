//
//  PeopleItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI

struct PeopleItem: View {
    var image: Image
    
    var body: some View {
        VStack {
            image.resizable().frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 0))
                .shadow(radius: 7)
            Text("The name of the cast").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
        }
    }
}

struct PeopleItem_Previews: PreviewProvider {
    static var previews: some View {
        PeopleItem(image: Image("cast_placeholder"))
    }
}
