//
//  MovieDetailModel.swift
//  MovieDB
//
//  Created by MAC os on 8/30/22.
//

import Foundation

import UIKit
import SwiftyJSON
struct DetailModel:Identifiable {
    
    var id: UUID
    var original_title:String
    var release_date:String
    var overview:String
    var poster_path:String
    
    init(jsonObject: JSON)  {
        
        id = UUID()
        original_title = jsonObject["original_title"].stringValue
        release_date = jsonObject["release_date"].stringValue
        overview = jsonObject["overview"].stringValue
        poster_path = jsonObject["poster_path"].stringValue
    }
}

