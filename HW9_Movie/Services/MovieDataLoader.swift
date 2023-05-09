//
//  MovieData.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//
import SwiftUI
import Foundation

var baseURL = "http://localhost:3000/"
func resetDefaults() {
    let defaults = UserDefaults.standard
    let dictionary = defaults.dictionaryRepresentation()
    dictionary.keys.forEach { key in
        defaults.removeObject(forKey: key)
    }
}

// demodata
var currMoviesDemo: [MovieTVBrief] = demojsonparser("currmoviedata.json");
var castsDemo: [Cast] = demojsonparser("castdata.json");
var reviewsDemo: [Review] = demojsonparser("reviewdata.json");
var searchDemo: [MovieTVBriefWithRate] = demojsonparser("searchdata.json");

//parse the demo local json data
func demojsonparser<T: Decodable>(_ filename: String) ->T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle")
    }
    do{
        data = try Data(contentsOf: file)
    }
    catch{
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch{
        fatalError("Couldn't find \(filename) in main bundle")
    }
}

func getURLString(str: String) -> String{
    return baseURL + str;
}

func getURLStringWithMediaAndID(query: String, media: String, id: Int) -> String{
    return baseURL + query + "/" + media + "/" + String(id);
}

func getSearchURL(keyword: String) ->String{
    let urlStr = keyword.replacingOccurrences(of: " ", with: "%20")
    return baseURL + "search/" + urlStr;
}


func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}
