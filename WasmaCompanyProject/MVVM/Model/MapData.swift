//
//  MapData.swift
//  WasmaCompanyProject
//
//  Created by mac on 2/20/20.
//  Copyright © 2020 iti. All rights reserved.
//



import Foundation
import MapKit

class CityLocation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

struct MapData : Codable {
    var ref_country_codes : [Country]
}

struct Country : Codable {
    var country : String?
    var alpha2: String?
    var alpha3: String?
    var numeric : Int?
    var latitude : Int?
    var longitude : Int?
    
}
