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
