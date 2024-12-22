//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by MAC os on 8/30/22.
//


import Foundation
import Alamofire
import SwiftyJSON

public class MovieViewModel{
    public static let shared = MovieViewModel()
    var loadedMovies = [DetailModel]()
    
    func getMovieseList( completion: @escaping ([DetailModel]?) -> ()) {
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjkwZGRmOGY0NzU3YTIxNzU5MjRlNzU4MTNmNmNmYyIsInN1YiI6IjYzMGQ5MjBlZGNiNmEzMDA3YmI0ZDI3ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.v2HsrAwLLIeIjpZvncFMs1ngvYMBb2nIZNaXg0RIGkk",
            "Content-Type" : "application/json;charset=utf-8"
        ]
        let url = "https://api.themoviedb.org/4/list/1"
        
        AF.request(url , method: .get,headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let response):
                let json = JSON(response)
                
                if json == nil{
                    completion(nil)
                }else{
                    for (_,subJson):(String,JSON) in json["results"]{
                        let item : DetailModel = DetailModel(jsonObject: subJson)
                        self.loadedMovies.append(item)
                    }
                    completion(self.loadedMovies)
                }
            case .failure( _):
                completion(nil)
            }
        }
    }
}

