//
//  MovieData.swift
//  HW9_Movie
//
//  Created by PYL on 4/11/21.
//

import Foundation
import Alamofire
import SwiftyJSON

var currMovies: [MovieTVBrief] = loadmovie("currmoviedata.json");
var castsDemo: [Cast] = loadmovie("castdata.json");
var reviewsDemo: [Review] = loadmovie("reviewdata.json");
var searchDemo: [MovieTVBriefWithRate] = loadmovie("searchdata.json");

func loadmovie<T: Decodable>(_ filename: String) ->T{
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




func getMovieTVArrayFromURL(urlString: String){
    var urlBase = "http://localhost:3000/";
    var url = urlBase + urlString;
    let request = AF.request(url);
    request.responseJSON{ response in
        debugPrint(response);
    }
}



