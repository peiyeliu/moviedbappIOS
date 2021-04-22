//
//  Description.swift
//  HW9_Movie
//
//  Created by PYL on 4/20/21.
//

import SwiftUI

struct Description: View {
    @State private var showMore = true;
    @State private var label = "Show more..";
    var text: String;
    
    var body: some View {
        VStack (alignment: .trailing){
            VStack{
                if showMore{
                    Text("\(text)").lineLimit(3)
                }
                else{
                    Text("\(text)")
                }
            }
            
            VStack{
                Button(action: {
                    if showMore {
                        label = "Show less"
                        showMore = false;
                    }
                    else{
                        label = "Show more.."
                        showMore = true;
                    }
                }, label: {
                    Text("\(label)")
                        .foregroundColor(Color.gray)
            }).buttonStyle(PlainButtonStyle())
            }
        }.padding(.horizontal)
    }
}

struct Description_Previews: PreviewProvider {
    static var previews: some View {
        Description(text: "I've implemented the show more/less using a boolean to either display the limited text or full text, however it doesn't show full text even after clicking show more. It displays more than three lines, but still cuts off text. I fixed this problem initially by adding .frame(maxHeight: infinity) to the HStack with the full text, but now this doesn't work either. ")
    }
}
