//
//  Demoview.swift
//  HW9_Movie
//
//  Created by PYL on 4/27/21.
//

import SwiftUI

struct Demoview: View {
    var body: some View {
        VStack {
            Text("This is the main view")
        }
        VStack{
            SubView();
        }
        
    }
}

struct Demoview_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Demoview()
        }
    }
}


struct SubView: View {
    @State private var showToast: Bool = false
    var body: some View {
        
        VStack {
            Text("This is subview").onLongPressGesture {
                debugPrint("long press detected")
                if (!self.showToast) {
                    withAnimation {
                        self.showToast = true
                    }
                }
            }
        }.toast(isPresented: self.$showToast) {
            VStack(alignment: .leading){
                HStack {
                    Text("Add in WatchList")
                    Spacer()
                    Image(systemName: "bookmark").colorMultiply(.black)
                }
                Link(destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/) {
                    HStack {
                        Text("Share on Facebook")
                        Spacer()
                        Image("facebook-app-symbol").resizable().frame(width: 20, height: 20)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Link(destination: /*@START_MENU_TOKEN@*/URL(string: "https://www.apple.com")!/*@END_MENU_TOKEN@*/)  {
                    HStack {
                        Text("Share on Twitter")
                        Spacer()
                        Image("twitter").resizable().frame(width: 20, height: 20)
                    }
                }.buttonStyle(PlainButtonStyle())
            }
        } //toast //VStack
        
    }
}
