//
//  MovieTVItem.swift
//  HW9_Movie
//
//  Created by PYL on 4/10/21.
//

import SwiftUI
import Kingfisher


struct MovieTVItem: View {
    var item: MovieTVBrief;
    @State private var showToast: Bool = false
    @State private var detail: MovieTVDetail = MovieTVDetail(id: 0, year: "2022", media: "dummy", mediaStr: "dummy", name: "dummy", poster: "dummy", genre: "dummy", rate: "dummy", youtube: "dummy", overview: "dummy")
    @State private var itemAdded: Bool = false
    
    var body: some View {
        VStack {
            NavigationLink (
                destination: ResultPage(media: item.media, id: item.id)){
                VStack{
                    KFImage(URL(string: item.poster)!).resizable().frame(width: 120, height: 180, alignment: .center).cornerRadius(20)
                    Text(item.name).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.center).frame(width: 120)
                    Text("(\(item.year))")
                        .foregroundColor(Color.gray)
                }.frame(width: 100)
//                .onLongPressGesture {
//                    if (!self.showToast) {
//                        withAnimation {
//                            self.showToast = true
//                        }
//                    }
//                }
            }.buttonStyle(PlainButtonStyle())
        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/).onAppear(perform: {
            loaddetail(media: item.media, id: item.id)
            let key = item.media + "/" + String(item.id);
            if(isKeyPresentInUserDefaults(key: key)){
                itemAdded = true
            }
        })
    }
    
    
    func loaddetail(media: String, id: Int) {
        guard let url = URL(string: getURLStringWithMediaAndID(query: "watch", media: media, id: id)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(MovieTVDetail.self,from: data)
                        detail = decodedData
                    } catch {
                        print("decode error")
                    }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct MovieTVItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieTVItem(item: currMoviesDemo[0]);
    }
}



