////
////  DragDropDemo.swift
////  HW9_Movie
////
////  Created by PYL on 4/20/21.
////
//
//import SwiftUI
//import WebKit
//
//struct DragDropDemo: View {
//    @StateObject var pageData = PageViewModel()
//
//    @Namespace var animation
//    let colomns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
//
//    var body: some View {
//        VStack {
//            ScrollView{
//                LazyVGrid(columns: colomns, spacing: 20, content: {
//                    ForEach(pageData.urls){
//                        page in
//                        WebView(url: page.url).frame(height: 200).onDrag({
//                            pageData.currentPage = page
//                            return NSItemProvider(contentsOf: URL(string: "\(page.id)")!)!
//                        }).onDrop(of: [.url], delegate: DropViewDelegate(page: page, pageData: pageData))
//                    }
//                })
//            }
//        }
//    }
//}
//
//struct DragDropDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        DragDropDemo()
//    }
//}
//
//struct WebView: UIViewRepresentable{
//    typealias UIViewType = WKWebView
//
//
//    var url: URL
//
//    func makeUIView(context: Context) -> WKWebView {
//        let view = WKWebView()
//        view.load(URLRequest(url: url))
//        view.isUserInteractionEnabled = false
//        view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
//        return view
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context){}
//}
//
//struct Page: Identifiable{
//    var id = UUID().uuidString
//    var url : URL
//}
//
//class PageViewModel: ObservableObject{
//    @Published var selectedTab = "device"
//    @Published var urls = [
//        Page(url: URL(string: "https://www.google.com")!),
//        Page(url: URL(string: "https://www.apple.com")!),
//        Page(url: URL(string: "https://www.facebook.com")!),
//        Page(url: URL(string: "https://www.twitter.com")!),
//        Page(url: URL(string: "https://www.baidu.com")!),
//        Page(url: URL(string: "https://www.gmail.com")!)
//    ]
//
//    @Published var currentPage: Page?
//}
//
//
//struct DropViewDelegate: DropDelegate{
//    var page: Page
//    var pageData: PageViewModel
//
//    func performDrop(info: DropInfo) -> Bool {
//        return true
//    }
//
//    func dropEntered(info: DropInfo) {
//        let fromIndex = pageData.urls.firstIndex{
//            (page) -> Bool in
//            return page.id == pageData.currentPage?.id
//        } ?? 0
//
//        let toIndex = pageData.urls.firstIndex{
//            (page) -> Bool in
//            return page.id == self.page.id
//        } ?? 0
//
//        if fromIndex != toIndex{
//            let fromPage = pageData.urls[fromIndex]
//            pageData.urls[fromIndex] = pageData.urls[toIndex]
//            pageData.urls[toIndex] = fromPage
//        }
//    }
//
//    func dropUpdated(info: DropInfo) -> DropProposal? {
//        return DropProposal(operation: .move)
//    }
//}
