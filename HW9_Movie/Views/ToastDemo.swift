//
//  ToastDemo.swift
//  HW9_Movie
//
//  Created by PYL on 4/16/21.
//

import SwiftUI

struct ToastDemo: View {
    @State private var showToast: Bool = false

    var body: some View {
        VStack {
            Spacer()
            VStack{
                Image("rainbowlake")
                Text("Rainbowlake")
            }
            .frame(height: 300.0)
            VStack {
                Text("Long Tap me")
            }.onLongPressGesture {
                if (!self.showToast) {
                    withAnimation {
                        self.showToast = true
                    }
                }
            }
            
            VStack {
                Text("ToastModuleTest")
                
                
            }
            VStack{
                Image("rainbowlake")
                Text("Rainbowlake")
            }
            .frame(height: 300.0)
        
        }.itemtoast(isPresented: self.$showToast) {
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
    } //body
}

extension View {
    func toast<Content>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View where Content: View {
        Toast(
            isPresented: isPresented,
            presenter: { self },
            content: content
        )
    }
    
    func itemtoast<Content>(isPresented: Binding<Bool>, content: @escaping () -> Content) -> some View where Content: View {
        ItemToast(
            isPresented: isPresented,
            presenter: { self },
            content: content
        )
    }
}

struct ToastDemo_Previews: PreviewProvider {
    static var previews: some View {
        ToastDemo()
    }
}

struct Toast<Presenting, Content>: View where Presenting: View, Content: View {
    @Binding var isPresented: Bool
    let presenter: () -> Presenting
    let content: () -> Content
    let delay: TimeInterval = 2

    var body: some View {
        if self.isPresented {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                withAnimation {
                    self.isPresented = false
                }
            }
        }

        return GeometryReader { geometry in
            ZStack(alignment: .top) {
                self.presenter().blur(radius: self.isPresented ? 1 : 0)

                ZStack {
                    Rectangle()
                        .fill(Color.gray).cornerRadius(20)
                    self.content().padding(.all)
                }.position(x: 150, y: 550)
                //ZStack (inner)
                .frame(width: geometry.size.width / 1.25, height: geometry.size.height / 10)
                .opacity(self.isPresented ? 1 : 0)
                
            }
        }
    }
}



struct ItemToast<Presenting, Content>: View where Presenting: View, Content: View {
    @Binding var isPresented: Bool
    let presenter: () -> Presenting
    let content: () -> Content
    let delay: TimeInterval = 2

    var body: some View {
        if self.isPresented {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                withAnimation {
                    self.isPresented = false
                }
            }
        }

        return GeometryReader { geometry in
            ZStack(alignment: .top) {
                self.presenter().blur(radius: self.isPresented ? 1 : 0)

                ZStack {
                    Rectangle()
                        .fill(Color.gray).cornerRadius(20)
                    self.content().padding(.all)
                }.offset(x:50, y: 100)
                //ZStack (inner)
                .frame(width: geometry.size.width / 1.25, height: geometry.size.height / 10)
                .opacity(self.isPresented ? 1 : 0)
                
            }
        }
    }
}

