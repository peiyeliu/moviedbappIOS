//
//  MovieTV.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//
import Foundation

struct MovieTVBriefList: Codable{
    var results: [MovieTVBrief]
    init(results: [MovieTVBrief]) {
        self.results = results
    }
}

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

class MovieTVBriefWithRateList: Codable, ObservableObject{
    var results: [MovieTVBriefWithRate]
    init(results: [MovieTVBriefWithRate]) {
        self.results = results
    }
    init(){
        self.results = [MovieTVBriefWithRate]()
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



struct MovieTVDetailList: Codable{
    var results: [MovieTVDetail]
    init(results: [MovieTVDetail]) {
        self.results = results
    }
}

struct MovieTVDetail: Hashable, Identifiable, Codable{
    var id: Int;
    var year: String;
    var media: String;
    var mediaStr: String;
    var name: String;
    var genre: String;
    var rate: String;
    var youtube: String;
    var overview: String;
    var poster: String;
    
    init(id: Int, year: String, media: String, mediaStr: String, name: String,
         poster: String, genre: String, rate: String, youtube: String, overview: String) {
        self.id = id;
        self.year = year;
        self.media = media;
        self.mediaStr = mediaStr;
        self.name = name;
        self.genre = genre;
        self.rate = rate;
        self.poster = poster;
        self.youtube = youtube;
        self.overview = overview;
    }
}

struct CastList: Codable{
    var results: [Cast]
    init(results: [Cast]) {
        self.results = results
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


struct ReviewList: Codable{
    var results: [Review]
    init(results: [Review]) {
        self.results = results
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

struct WatchListItem: Identifiable{
    var id: Int;
    var media: String;
    var poster: String;
    init(id: Int, media: String, poster: String){
        self.id = id;
        self.media = media;
        self.poster = poster;
    }
}


