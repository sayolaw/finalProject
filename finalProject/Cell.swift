//
//  Cell.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import Foundation

var sites:[Site]?

struct SiteM{
    var title:String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
  
    init(title: String, latitude: Double, longitude: Double){
        
        self.title = title
        self.latitude = latitude
        self.longitude = longitude
    }
}

