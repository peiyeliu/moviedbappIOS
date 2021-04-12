//
//  MovieTV.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//
import Foundation

struct MovieTVBrief: Hashable, Codable, Identifiable{
    var id: Int;
    var year: String;
    var media: String;
    var mediaStr: String;
    var name: String;
    var poster: String;
    init(id: Int, year: String, media: String, mediaStr: String, name: String, poster: String) {
        self.id = id;
        self.year = year;
        self.media = media;
        self.mediaStr = mediaStr;
        self.name = name;
        self.poster = poster;
    }
}

struct MovieTVBriefWithRate: Hashable, Codable, Identifiable{
    var id: Int;
    var year: String;
    var media: String;
    var mediaStr: String;
    var name: String;
    var poster: String;
    var rate: String;
    init(id: Int, year: String, media: String, mediaStr: String, name: String, poster: String, rate: String) {
        self.id = id;
        self.year = year;
        self.media = media;
        self.mediaStr = mediaStr;
        self.name = name;
        self.poster = poster;
        self.rate = rate;
    }
}

struct MovieTVDetail: Hashable, Identifiable, Codable{
    var id: Int;
    var year: String;
    var media: String;
    var mediaStr: String;
    var name: String;
    var poster: String;
    var genre: String;
    var rate: String;
    var youtube: String;
    init(id: Int, year: String, media: String, mediaStr: String, name: String, poster: String, genre: String, rate: String, youtube: String) {
        self.id = id;
        self.year = year;
        self.media = media;
        self.mediaStr = mediaStr;
        self.name = name;
        self.poster = poster;
        self.genre = genre;
        self.rate = rate;
        self.youtube = youtube;
    }
}

struct Cast: Hashable, Identifiable, Codable{
    var id: Int;
    var name: String;
    var photo: String;
    init(id: Int, name: String, photo: String) {
        self.id = id;
        self.name = name;
        self.photo = photo;
    }
}

struct Review: Hashable, Identifiable, Codable{
    var id: String;
    var author: String;
    var time: String;
    var rate: String;
    var content: String;
    init(id: String, author: String, time: String, rate: String, content: String) {
        self.id = id;
        self.author = author;
        self.time = time;
        self.rate = rate;
        self.content = content;
    }
}

struct HomePage: Codable{
    var currMov: [MovieTVBrief];
    var topMov: [MovieTVBrief];
    var popMov: [MovieTVBrief];
    var currTv: [MovieTVBrief];
    var topTv: [MovieTVBrief];
    var popTv: [MovieTVBrief];
}

