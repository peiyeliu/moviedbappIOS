//
//  ImageCarouselViewWapper.swift
//  HW9_Movie
//
//  Created by PYL on 4/16/21.
//

import SwiftUI
import Kingfisher

struct ImageCarouselViewWapper: View {
    var urlQuery: String;
    @State private var jsonList = [MovieTVBrief]()
    var body: some View {
        GeometryReader { geometry in
            ImageCarouselView(numberOfImages: jsonList.count){
                ForEach(jsonList){
                    item in
                    ZStack {
                        KFImage(URL(string: item.poster)!).resizable().frame(width: geometry.size.width, height: geometry.size.height).blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        
                        NavigationLink(
                            destination: ResultPage(media: item.media, id: item.id)) {
                            KFImage(URL(string: item.poster)!).resizable().frame(width: 300, height: geometry.size.height)
                        }
                    }
                }
            }
        }.frame(width: 360, height: 380, alignment:.center ).onAppear(perform: {
            loadmovies()
        })
    }
    func loadmovies() {
        guard let url = URL(string: getURLString(str: urlQuery)) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MoiveTVBriefList.self, from: data) {
                    DispatchQueue.main.async {
                        self.jsonList = decodedResponse.results
                    }
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ImageCarouselViewWapper_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselViewWapper(urlQuery: "currentmovie")
    }
}
