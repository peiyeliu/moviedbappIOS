//
//  Home.swift
//  HW9_Movie
//
//  Created by PYL on 4/9/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            List {
                    VStack {
                        Text("Now Playing")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                
                    VStack {
                        Text("Here is the Now Playing")
                    }.frame(height: 400)
                
                    VStack {
                        Text("Top Rated")
                            .font(.title)
                            .fontWeight(.bold)
                        //MovieTVItemScroll()
                    }

                
                    VStack {
                        Text("Top Rated")
                            .font(.title)
                            .fontWeight(.bold)
                        //MovieTVItemScroll()
                    }
                
                   NavigationLink(destination: ResultPage()) {
                       Text("Go to detail page")
                   }
                }
                .navigationBarTitle("USC Film")
                .navigationBarItems(
                    trailing:
                    HStack{
                        Button("TV shows"){}
                    })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
