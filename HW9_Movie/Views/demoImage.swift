//
//  demoImage.swift
//  HW9_Movie
//
//  Created by PYL on 4/8/21.
//

import SwiftUI

struct demoImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct demoImage_Previews: PreviewProvider {
    static var previews: some View {
        demoImage(image: Image("turtlerock"))
    }
}

