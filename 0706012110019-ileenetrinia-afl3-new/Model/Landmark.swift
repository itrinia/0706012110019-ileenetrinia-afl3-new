//
//  Landmark.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    //add a Category enumeration and a category property to the Landmark structure.
    //The landmarkData.json file already includes a category value for each landmark with one of three string values. By matching the names in the data file, i can rely on the structure’s Codable conformance to load the data. jd yg d bwh ini adlh memanggol 3 data ituu
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    
    var image: Image{
        Image(imageName)
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
