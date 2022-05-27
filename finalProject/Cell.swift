//
//  Cell.swift
//  finalProject
//
//  Created by Sayo Lawal on 2022-05-26.
//

import Foundation
struct Site{
    var image:String = ""
    var title:String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
  
    init(image: String, name: String, latitude: Double, longitude: Double){
        self.image = image
        self.title = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
