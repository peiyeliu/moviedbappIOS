//
//  LoadView.swift
//  HW9_Movie
//
//  Created by PYL on 4/19/21.
//

import SwiftUI

struct LoadViewer: UIViewRepresentable {
    @Binding var shouldAnimate: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .gray
        indicator.backgroundColor = .white
        indicator.hidesWhenStopped = true;
//        indicator.startAnimating()
        
        indicator.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin,
                                      .flexibleTopMargin, .flexibleBottomMargin]
            
        return indicator
    }
    
    typealias UIViewControllerType = UIActivityIndicatorView
    
    
    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        if self.shouldAnimate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
