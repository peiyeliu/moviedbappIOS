//
//  ImageCarouselView.swift
//  HW9_Movie
//
//  Created by PYL on 4/16/21.
//




import SwiftUI
import Combine
import SwiftUI
import Kingfisher


struct ImageCarouselView<Content: View>: View {
    private var numberOfImages: Int
    private var content: Content

    @StateObject private var carouselViewModel = ImageCarouselViewModel()

    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
            .offset(x: CGFloat(self.carouselViewModel.currentIndex) * -geometry.size.width, y: 0)
            .animation(.spring())
            .onReceive(self.timer) { _ in
                self.carouselViewModel.moveToNextImage()
            }
        }
    }
}

class ImageCarouselViewModel: ObservableObject {
    @Published var currentIndex: Int = 0

    func moveToNextImage() {
        currentIndex = (currentIndex + 1) % 20
    }
}

struct ImageCarouselViewWapper: View {
    var urlQuery: String
    @StateObject var carouselViewModel: ImageCarouselViewModel
    @State private var jsonList = [MovieTVBrief]()

    var body: some View {
        GeometryReader { geometry in
            ImageCarouselView(numberOfImages: jsonList.count) {
                ForEach(jsonList) { item in
                    ZStack {
                        KFImage(URL(string: item.poster)!)
                            .resizable()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .blur(radius: 3.0)

                        NavigationLink(
                            destination: ResultPage(media: item.media, id: item.id)
                        ) {
                            KFImage(URL(string: item.poster)!)
                                .resizable()
                                .frame(width: 280, height: geometry.size.height)
                        }
                    }
                }
            }
        }
        .frame(alignment: .center)
        .onAppear {
            loadMovies()
        }
    }

    func loadMovies() {
        guard let url = URL(string: getURLString(str: urlQuery)) else {
            debugPrint("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        debugPrint(url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MovieTVBriefList.self, from: data) {
                    DispatchQueue.main.async {
                        self.jsonList = decodedResponse.results
                    }
                    return
                }
            }
            debugPrint("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}
