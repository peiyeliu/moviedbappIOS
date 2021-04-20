//
//  Overview.swift
//  HW9_Movie
//
//  Created by PYL on 4/19/21.
//

import SwiftUI
import ReadMoreTextView

struct Overview: UIViewRepresentable {
  
    
    
    @State var overviewText: String
    
    let textView = ReadMoreTextView()

    func makeUIView(context: Context) -> ReadMoreTextView{
        //textView.text = overviewText;
        textView.shouldTrim = true
        textView.maximumNumberOfLines = 3
        textView.attributedReadMoreText = NSAttributedString(string: "... Read more")
        textView.attributedReadLessText = NSAttributedString(string: " Read less")
        return textView;
    }
    
    func updateUIView(_ uiView: ReadMoreTextView, context: Context) {
        textView.text = overviewText;
    }
}

