//
//  youtubeVideo.swift
//  HW9_Movie
//
//  Created by PYL on 4/16/21.
//

import SwiftUI
import UIKit

import youtube_ios_player_helper
 

struct YoutubePicker: UIViewRepresentable{
    
    var text: String;

    func makeUIView(context: Context) -> YTPlayerView{
        return YTPlayerView()
    }

    func updateUIView(_ view: YTPlayerView, context: Context) {
        view.load(withVideoId: text)
    }
}



