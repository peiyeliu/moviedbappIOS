//
//  ToastDemo.swift
//  HW9_Movie
//
//  Created by PYL on 4/16/21.
//

import SwiftUI

struct ToastDemo: View {
    @State private var lightsOn: Bool = false
    @State private var showToast: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                if (!self.showToast) {
                    self.lightsOn.toggle()

                    withAnimation {
                        self.showToast = true
                    }
                }
            }){
                Text("switch")
            }
            .padding(.top)
            Spacer()
            VStack {
                Text("Long Tap me")
            }.onLongPressGesture {
                if (!self.showToast) {
                    self.lightsOn.toggle()

                    withAnimation {
                        self.showToast = true
                    }
                }
            }

            Image(systemName: self.lightsOn ? "lightbulb" : "lightbulb.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.all)
                .toast(isPresented: self.$showToast) {
                    VStack(alignment: .leading){
                        HStack {
                            Text("Add in WatchList")
                            Spacer()
                            Image(systemName: "bookmark").colorMultiply(.black)
                        }
                        HStack {
                            Text("Share on Facebook")
                            Spacer()
                            Image("facebook-app-symbol").resizable().frame(width: 20, height: 20)
                        }
                        HStack {
                            Text("Share on Twitter")
                            Spacer()
                            Image("twitter").resizable().frame(width: 20, height: 20)
                        }
                    }
                } //toast
        } //VStack
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
            ZStack(alignment: .bottom) {
                self.presenter()

                ZStack {
                    Rectangle()
                        .fill(Color.gray).cornerRadius(20)
                    self.content().padding(.all)
                }//ZStack (inner)
                .frame(width: geometry.size.width / 1.25, height: geometry.size.height / 10)
                .opacity(self.isPresented ? 1 : 0)
            }
            .padding(.bottom)
        }
    }
}

